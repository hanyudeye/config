;;; conf-read.el --- 逐句高亮并复制到系统剪贴板，供 Balabolka 等朗读软件朗读  -*- lexical-binding: t; -*-
;; SPC o r 开始 / 停止。

(require 'subr-x)
(require 'cl-lib)

(defcustom my-read-cps 0.5
  "估算朗读速度：每秒字符数（中文约 4~6，按语速调整）。"
  :type 'number)

(defcustom my-read-face 'highlight
  "朗读时高亮当前句使用的 face。"
  :type 'face)

(defcustom my-read-min-delay 1.2
  "每句最短等待秒数。"
  :type 'number)

(defvar-local my-read--timer nil)
(defvar-local my-read--ov nil)

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
  (message "已停止"))

(defun my-read ()
  "从光标处逐句高亮并复制到剪贴板，供 Balabolka 朗读；再执行一次停止。"
  (interactive)
  (if (timerp my-read--timer)
      (my-read-stop)
    (let ((buf (current-buffer)))
      ;; 让 forward-sentence 认识中文句末标点
      (setq-local sentence-end-base "[.?!…‽。！？][]\"'”’)}»›]*")
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
                          (max my-read-min-delay
                               (/ (float (length txt)) my-read-cps))
                          nil (lambda () (step end)))))))))
        (step (point))))))

(spacemacs/set-leader-keys "o r" #'my-read)

(provide 'conf-read)
