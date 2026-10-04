;;; conf-llm.el -*- lexical-binding: t; -*-
;; .authinfo 配置信息
;; machine api.deepseek.com login apikey password KEY
(use-package gptel
  :config
  ;; OPTIONAL configuration
  (setq gptel-api-key (auth-source-pick-first-password :host "api.deepseek.com"))

  (gptel-make-preset 'mycoding
    :description "写代码模式: deepseek + 严格系统提示"
    :system "你是一个专业代码助手，提供清洁，专业的代码输出."
    )

  ;; (gptel-make-preset '课程学习
  ;;   :description "输入某项专业技能，然后输入继续"
  ;;   :system "给我一个学习某项专业知识的提示词，每次给我一些任务节点，不给我答案，当我学习完成，我会输入'继续' ，那你再往下给我一些任务节点，直到最终我把这个专项课程学习完。下面，你先问我要学什么专项课程，我输入课程名称后你给我一些任务，然后你按上面指令形式，响应我的输入'继续'"
  ;;   )

  (gptel-make-preset '英译中
    :system "你是专业译者,将用户输入翻译成通顺的简体中文,只输出译文,不要解释。")
  (gptel-make-preset '中译英
    :system "You are a professional translator. Translate the user's text into natural English. Output only the translation.")

  ;; (setq gptel-default-preset 'mycoding)

  (gptel-make-deepseek "DeepSeek"
    :stream t
    :models '(deepseek-v4-flash)
    :key gptel-api-key
    ;; :key "gptel-api-key"
    )


  (gptel-make-ollama "Ollama"
    ;; :host "192.168.110.162:11434"
    :host "localhost:11434"
    :stream t
    :models '(gemma4:latest llama3:latest )
    )


  (setq
   ;; gptel-model 'gemma4:e4b
   gptel-backend (gptel-get-backend "DeepSeek")
   ;; gptel-backend (gptel-get-backend "Ollama")
   gptel-model 'deepseek-v4-flash
   gptel-include-reasoning nil
   )
  )

;; ============================================================
;; gptel 翻译 - 异步流式，底部窗口显示（替代 ellama-translate）
;; ============================================================
(defvar my/gptel-translate-buffer "*gptel-translate*"
  "gptel 翻译结果展示 buffer.")

(defun my/gptel-translate--display-buffer (buffer)
  "用底部 30% 窗口显示 BUFFER，复用已有翻译窗口。"
  (let ((window
         (or
          (seq-find
           (lambda (win)
             (and (window-live-p win)
                  (eq (window-parameter win 'gptel-translate-window) t)))
           (window-list (selected-frame) 'no-minibuffer))
          (display-buffer-in-direction buffer '((direction . below) (window-height . 0.30))))))
    (when (window-live-p window)
      (set-window-parameter window 'gptel-translate-window t)
      (set-window-buffer window buffer)
      (with-current-buffer buffer
        (visual-line-mode 1)
        (setq-local truncate-lines nil)
        (read-only-mode -1)))
    window))

(defun my/gptel-translate--with-system (system)
  "用 SYSTEM 异步翻译选中文本，纯译文流式输出到底部窗口。"
  (let* ((raw (if (use-region-p)
                  (buffer-substring-no-properties (region-beginning) (region-end))
                (or (thing-at-point 'word t) "")))
         (text (string-trim raw)))
    (when (string-empty-p text)
      (user-error "没有可翻译的文本（请先选中）"))
    (let ((buf (get-buffer-create my/gptel-translate-buffer)))
      (with-current-buffer buf
        (read-only-mode -1)
        (erase-buffer)
        (goto-char (point-max)))
      (my/gptel-translate--display-buffer buf)
      (gptel-request text
        :stream t
        :system system
        :buffer buf
        :callback
        (lambda (resp info)
          (let ((target-buf (plist-get info :buffer)))
            (when (buffer-live-p target-buf)
              (with-current-buffer target-buf
                (let ((inhibit-read-only t))
                  (cond
                   ((stringp resp)
                    (goto-char (point-max))
                    (insert resp)
                    (when (window-live-p (get-buffer-window target-buf))
                      (with-selected-window (get-buffer-window target-buf)
                        (goto-char (point-max))
                        (recenter -1))))
                   ((and (consp resp) (eq (car resp) 'reasoning)) nil)
                   ((eq resp t)
                    (goto-char (point-max))
                    (insert "\n")
                    (read-only-mode 1)
                    (message "翻译完成"))
                   ((null resp)
                    (goto-char (point-max))
                    (insert (format "\n[翻译失败: %s]" (plist-get info :status)))
                    (read-only-mode 1))))))))))))

(defun my/gptel-translate ()
  "自动识别中英并翻译（兼容旧快捷键）。
含中文 -> 译英，否则译中。"
  (interactive)
  (let* ((raw (if (use-region-p)
                  (buffer-substring-no-properties (region-beginning) (region-end))
                (or (thing-at-point 'word t) "")))
         (text (string-trim raw))
         (has-chinese (string-match-p "\\cc" text)))
    (my/gptel-translate--with-system
     (if has-chinese
         "You are a professional translator. Translate the user's text into natural English. Output only the translation, no explanation."
       "你是专业译者，将用户输入翻译成通顺的简体中文，只输出译文，不要解释。"))))

(defun my/gptel-translate-zh-en ()
  "中译英：强制将选中文本译为英文。"
  (interactive)
  (my/gptel-translate--with-system
   "You are a professional translator. Translate the user's text into natural English. Output only the translation, no explanation."))

(defun my/gptel-translate-en-zh ()
  "英译中：强制将选中文本译为简体中文。"
  (interactive)
  (my/gptel-translate--with-system
   "你是专业译者，将用户输入翻译成通顺的简体中文，只输出译文，不要解释。"))


(use-package ellama
  :ensure t
  :bind ("C-c e" . ellama)
  :hook (org-ctrl-c-ctrl-c-hook . ellama-chat-send-last-message)
  :init (setopt ellama-auto-scroll t)
  :config
  (require 'llm-deepseek)
  (setq ellama-provider
        (make-llm-deepseek
         :key (auth-source-pick-first-password :host "api.deepseek.com")
         :chat-model "deepseek-v4-flash"
         )
        )
  (setq llm-warn-on-nonfree nil)
  (ellama-context-header-line-global-mode +1)
  (ellama-session-header-line-global-mode +1))

;; gptel 翻译快捷键
;; SPC o e = 中译英 (你指定), SPC o c = 英译中, SPC o t = 自动识别
(spacemacs/set-leader-keys "o e" 'my/gptel-translate-zh-en)
(spacemacs/set-leader-keys "o c" 'my/gptel-translate-en-zh)
(spacemacs/set-leader-keys "o t" 'my/gptel-translate)
(global-set-key (kbd "C-c e") #'my/gptel-translate-zh-en)
(global-set-key (kbd "C-c c") #'my/gptel-translate-en-zh)

(provide 'conf-llm)
