;;; conf-read.el --- 逐句高亮并复制到系统剪贴板，供 Balabolka 等朗读软件朗读  -*- lexical-binding: t; -*-
;; SPC o r 开始 / 停止。
;; 朗读中按 C-c =（加快）/ C-c -（减慢）调节语速。

(require 'subr-x)
(require 'cl-lib)

(defcustom my-read-cps 0.5
  "估算朗读速度：每秒字符数（中文约 4~6，按语速调整）。"
  :type 'number)

(defcustom my-read-face 'highlight
  "朗读时高亮当前句使用的 face。"
  :type 'face)

(defcustom my-read-min-delay 1.2
  "每句最短等待秒数（基准语速下的下限）。"
  :type 'number)

(defcustom my-read-speed-step 1.5
  "每次调节语速的倍率（>1）。"
  :type 'number)

(defcustom my-read-speed-min 0.2
  "调速系数下限（数值越小越快）。"
  :type 'number)

(defcustom my-read-speed-max 10.0
  "调速系数上限（数值越大越慢）。"
  :type 'number)

(defcustom my-read-speed-up-keys '("C-c =" "C-c +")
  "朗读中加快语速的按键（修改后需重新加载 conf-read）。"
  :type '(repeat string))

(defcustom my-read-speed-down-keys '("C-c -" "C-c _")
  "朗读中减慢语速的按键（修改后需重新加载 conf-read）。"
  :type '(repeat string))

(defvar my-read--timer nil)
(defvar my-read--ov nil)
(defvar my-read--buf nil
  "正在朗读的 buffer。")
(defvar my-read--speed 1.0
  "朗读速度系数：实际每秒字符数 = `my-read-cps' / 该值。")

(defvar my-read-live-mode-map
  (let ((map (make-sparse-keymap)))
    (dolist (k my-read-speed-up-keys)
      (define-key map (kbd k) #'my-read-speed-up))
    (dolist (k my-read-speed-down-keys)
      (define-key map (kbd k) #'my-read-speed-down))
    map))

(define-minor-mode my-read-live-mode
  "朗读进行中启用，提供调速快捷键（见 `my-read-speed-up-keys'）。"
  :lighter " Read"
  :keymap my-read-live-mode-map)

(defun my-read-speed-show ()
  "显示当前朗读语速。"
  (interactive)
  (message "朗读语速：%.1f 字/秒（每句约 %.1f 秒）"
           (/ my-read-cps my-read--speed)
           (* my-read-min-delay my-read--speed)))

(defun my-read--set-speed (speed)
  "设置调速系数 SPEED 并显示结果。"
  (setq my-read--speed (max my-read-speed-min
                            (min my-read-speed-max speed)))
  (my-read-speed-show))

(defun my-read-speed-up ()
  "加快朗读高亮语速。"
  (interactive)
  (my-read--set-speed (/ my-read--speed my-read-speed-step)))

(defun my-read-speed-down ()
  "减慢朗读高亮语速。"
  (interactive)
  (my-read--set-speed (* my-read--speed my-read-speed-step)))

(defun my-read-speed-set (cps)
  "把语速设为每秒 CPS 字符后重算调速系数。"
  (interactive "n目标语速(字/秒): ")
  (my-read--set-speed (max (/ my-read-cps
                              (max 0.1 cps))
                          my-read-speed-min)))

(defun my-read--clipboard (text)
  "把 TEXT 写入系统剪贴板。"
  (cond
   ((display-graphic-p)
    (gui-set-selection 'CLIPBOARD text))
   ((executable-find "xclip")
    (with-temp-buffer
      (insert text)
      (call-process-region (point-min) (point-max)
                           "xclip" nil 0 nil "-selection" "clipboard")))
   ((executable-find "xsel")
    (with-temp-buffer
      (insert text)
      (call-process-region (point-min) (point-max) "xsel" nil 0 nil "-i" "-b")))
   (t (kill-new text))))

(defun my-read-stop ()
  (interactive)
  (when (timerp my-read--timer)
    (cancel-timer my-read--timer))
  (setq my-read--timer nil)
  (when (overlayp my-read--ov)
    (delete-overlay my-read--ov))
  (setq my-read--ov nil)
  (when (buffer-live-p my-read--buf)
    (with-current-buffer my-read--buf (my-read-live-mode -1))
    (setq my-read--buf nil))
  (message "已停止"))

(defun my-read ()
  "从光标处逐句高亮并复制到剪贴板，供 Balabolka 朗读；再执行一次停止。"
  (interactive)
  (if (timerp my-read--timer)
      (my-read-stop)
    (let ((buf (current-buffer)))
      ;; 让 forward-sentence 认识中文句末标点
      (setq-local sentence-end-base "[.?!…‽。！？][]\"'”’)}»›]*")
      (setq my-read--buf (current-buffer))
      (my-read-live-mode 1)
      (message "朗读中：C-c = 加快 / C-c - 减慢 / SPC o r 停止")
      (setq my-read--ov (make-overlay 1 1 nil nil t))
      (overlay-put my-read--ov 'face my-read-face)
      (cl-labels
          ((step (pos)
             (with-current-buffer buf
               (goto-char pos)
               (skip-chars-forward " \t\n\r")
               (if (>= (point) (point-max))
                   (my-read-stop)
                 (let* ((beg (point))
                        (_   (forward-sentence))
                        (end (point))
                        (txt (string-trim (buffer-substring-no-properties beg end))))
                   (when (<= end beg)
                     (setq end (min (point-max) (1+ beg))))
                   (move-overlay my-read--ov beg end)
                   (my-read--clipboard txt)
                   (when-let* ((win (get-buffer-window buf)))
                     (with-selected-window win (recenter)))
                   (setq my-read--timer
                          (run-at-time
                           (* my-read--speed
                              (max my-read-min-delay
                                   (/ (float (length txt)) my-read-cps)))
                           nil (lambda () (step end)))))))))
        (step (point))))))

(spacemacs/set-leader-keys "o r" #'my-read)

(provide 'conf-read)
