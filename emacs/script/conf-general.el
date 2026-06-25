;; 在 dotspacemacs/user-init 配置这个镜像
;; (setq configuration-layer-elpa-archives
;;       '(("melpa-cn" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;         ("org-cn"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
;;         ("gnu-cn"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))


;; 在 dotspacemacs/user-config 配置该脚本
;; (add-to-list 'load-path "~/me/config/emacs/script/")
;; (require 'conf-general)


(setq-default
 evil-escape-key-sequence "kj"
 evil-escape-delay 0.5
 ;;设置服务
 ;; dotspacemacs-server-socket-dir "~/.emacs/server"

 paradox-github-token  "21c2b26b816706e094472ea4bbe1d683a373ff0e"

 ;; sdcv 词典配置
 sdcv-word-pronounce nil
 sdcv-popup-function 'popup-tip
 sdcv-fail-notify-string nil
 ;; sdcv-popup-function 'popup-tip
 ;; sdcv-popup-function 'tooltip-show
 ;; sdcv-popup-function 'pos-tip-show
 ;;不发音
 ;; sdcv-word-pronounce nil

 ;; 解压缩
 nov-unzip-program (executable-find "d:/Program Files/Git/usr/bin/unzip.exe")

;;  browse-url-browser-function 'browse-url-generic
;;  browse-url-generic-program "/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"


 )

(setq elfeed-search-header-function #'elfeed-search--header)

;; 取消光标所在行的高亮
(global-hl-line-mode -1)
;; (package-install 'keycast)

(with-eval-after-load 'treemacs
  ;; 设置使用外部程序打开特定文件类型
  (treemacs-define-RET-action 'file-node-open
                              (lambda (path &rest _)
                                (cond
                                 ;; PDF 文件用外部程序打开
                                 ((string-suffix-p ".pdf" path)
                                  (start-process "okular" nil "start" path)) ;; 在 Linux 中，使用 xdg-open。你也可以根据系统调整，比如 macOS 用 open，Windows 用 start。

                                 ;; MP3 文件用外部程序打开
                                 ((string-suffix-p ".mp3" path)
                                  (start-process "PotPlayerMini64" nil "start" path))

                                 ;; MP4 文件用外部程序打开
                                 ((string-suffix-p ".mp4" path)
                                  (start-process "PotPlayerMini64" nil "start" path))

                                 ;; 默认行为（如打开文本文件）
                                 (t
                                  (find-file path))))))


;; 配置快捷键
(spacemacs/set-leader-keys "o s" 'sdcv-search-pointer+)
(spacemacs/set-leader-keys "o o" 'gptel-send)



;;配置 Evil中的 yy,p 使用全局剪切板，下面的配置没有用

;; 使用系统剪贴板
;; (setq x-select-enable-clipboard t)
;; (setq select-enable-clipboard t)
;; (setq select-enable-primary t)

;; ;; 配置 Evil Mode 使用剪贴板
;; (defun evil-yank-line-to-clipboard ()
;;   "将当前行复制到剪贴板"
;;   (interactive)
;;   (evil-yank-line)
;;   (let ((text (car kill-ring)))
;;     (kill-new text)    ;; 将文本保存到 kill-ring
;;     (with-temp-buffer
;;       (insert text)
;;       (clipboard-kill-region (point-min) (point-max)))))  ;; 使用系统剪贴板

;; (defun evil-paste-from-clipboard ()
;;   "从剪贴板粘贴内容"
;;   (interactive)
;;   (let ((clipboard-text (current-kill 0 t)))
;;     (insert clipboard-text)))

;; ;; 将 Evil 的 yy 和 p 重绑定到使用系统剪贴板
;; (define-key evil-normal-state-map "yy" 'evil-yank-line-to-clipboard)
;; (define-key evil-normal-state-map "p" 'evil-paste-from-clipboard)

;;  ---------------------------------- end-------------------------

;; (server-start)
(require 'conf-llm)

(provide 'conf-general)
