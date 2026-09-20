;; 在 dotspacemacs/user-init 配置这个镜像
;; (setq configuration-layer-elpa-archives
;;       '(("melpa-cn" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;         ("org-cn"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
;;          ("nongnu" . "https://elpa.nongnu.org/nongnu/")
;;         ("gnu-cn"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))


;; 在 dotspacemacs/user-config 配置该脚本
;; (add-to-list 'load-path "~/me/config/emacs/script/")
;; (require 'conf-general)


(setq-default
 evil-escape-key-sequence "kj"
 evil-escape-delay 0.5
 ;;设置服务
 ;; dotspacemacs-server-socket-dir "~/.emacs/server"

 ;; sdcv 词典配置
 ;;sdcv-word-pronounce nil
 sdcv-popup-function 'popup-tip
 sdcv-fail-notify-string nil
 ;; sdcv-popup-function 'popup-tip
 ;; sdcv-popup-function 'tooltip-show
 ;; sdcv-popup-function 'pos-tip-show
 ;;不发音
 sdcv-word-pronounce nil

 ;; 解压缩
 ;; nov-unzip-program (executable-find "d:/Program Files/Git/usr/bin/unzip.exe")

 ;; browse-url-browser-function 'browse-url-generic
 ;; browse-url-generic-program "/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
 ;; browse-url-generic-program "/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"
 browse-url-browser-function 'eww-browse-url

 ;; 配置 shell 终端的宽度
 ;; shell-default-shell 'eat
 shell-default-shell 'vterm
 shell-pop-window-size 30
 shell-pop-window-position "bottom"
 )

;; 配置 Org Agenda
(with-eval-after-load 'org
  (setq org-agenda-files '("~/me/wo/living/time.org"))
  ;; (setq org-agenda-files '("~/org/" "/mnt/d/me/wo/living/time.org"))
  ;;默认是日视图
  (setq org-agenda-span 'day)
  ;; (org-agenda-log-mode) 开启 log 模式只要使用 **L** 快捷键
  )

;; Emacs 29 removed `frame-alpha-lower-limit'，Spacemacs 的透明度/缩放代码仍引用它
(defvar frame-alpha-lower-limit 20)

(setq elfeed-search-header-function #'elfeed-search--header)

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

;;  ---------------------------------- end-------------------------

;; (server-start)
(require 'conf-llm)
(require 'conf-file)
(require 'conf-read)
(provide 'conf-general)
