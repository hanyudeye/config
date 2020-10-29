;; 针对单引号出现\' 的问题
;; (if (version< emacs-version "26.8")
;;     (setq sp-escape-quotes-after-insert nil))

;; semantic 报错问题，advice-add 可以重新定义函数的行为，但要注意少用
;; (advice-add 'semantic-idle-scheduler-function :around #'ignore)

(setq-default
 ;; 兼容 svn 项目
 git-enable-magit-svn-plugin t
 evil-escape-key-sequence "kj"
 evil-escape-delay 0.5
 paradox-github-token  "21c2b26b816706e094472ea4bbe1d683a373ff0e"
 ;;设置 sdcv 弹出框样式
 sdcv-popup-function 'popup-tip
 ;; sdcv-popup-function 'tooltip-show
 ;; sdcv-popup-function 'pos-tip-show
 ;;不发音
 sdcv-word-pronounce nil
 )


;;fcitx input set
;; (fcitx-aggressive-setup)
;; (fcitx-prefix-keys-add "M-m") ; M-m is common in Spacemacs
;; (setq fcitx-use-dbus t) ; uncomment if you're using Linux

;; 用于删除配对括号
(defadvice hungry-delete-backward (before sp-delete-pair-advice activate) (save-match-data (sp-delete-pair (ad-get-arg 0))))

;; 绑定微信小程序 文件模式
(setq auto-mode-alist (cons '("\\.wxml\\'" . web-mode)
                            auto-mode-alist))

(setq auto-mode-alist (cons '("\\.wxss\\'" . less-css-mode)
                            auto-mode-alist))


(setq-default 
 ;; google 翻译
 google-translate-default-source-language "en"
 google-translate-default-target-language "zh-CN"
 ;; google-translate-output-destination 'popup
 google-translate-show-phonetic nil
 ;;对于弹出buffer,是否获得焦点 
 google-translate-pop-up-buffer-set-focus t

 ;;hugo 博客配置
 easy-hugo-basedir "/home/wuming/blog/hugo/"
 ;; easy-hugo-url "http://127.0.0.1:1314/blog"
 easy-hugo-root "/home/wuming/blog/hugo"
 ;; easy-hugo-preview-url "http://127.0.0.1:1314/blog"
 ;; easy-hugo-sshdomain "hanyudeye@github.com"
 )

(setq easy-hugo-bloglist
      ;; blog2 setting
      '(((easy-hugo-basedir . "/home/wuming/blog/hugotest/")
         (easy-hugo-url . "http://127.0.0.1:1313/test")
         (easy-hugo-root "/home/wuming/blog/hugotest")
         )
        )
      )


;; (setq org-file-apps
;;       (quote
;;        ((auto-mode . emacs)
;;         ("\\.pdf\\'" . "okular %s"))))

(defun wuming/copy-datetime()
  "insert current time."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S" (current-time))))

(defun wuming/copy-date()
  "insert current date."
  (interactive)
  (insert (format-time-string "%Y 年 %m 月 %d 日" (current-time))))

(defun wuming/copy-month()
  "insert current month."
  (interactive)
  (insert (format-time-string "%Y 年 %m 月" (current-time))))


(evil-leader/set-key "o i t" 'wuming/copy-datetime)
(evil-leader/set-key "o i d" 'wuming/copy-date)
(evil-leader/set-key "o i m" 'wuming/copy-month)


;;调用朗读软件朗读选区
(defun langdu-espeak(start end)
  "朗读开始和 end 区域的内容"
  (interactive "r")
  (let ((content (buffer-substring start end)))
    ;; (call-process "/usr/bin/espeak" nil nil nil "-vzh" content)
    (call-process "/usr/bin/espeak" nil nil nil "-ven" content)
    ;; (ignore-errors (call-process "pmset" nil t nil "-g" "ps"))
    ;; (call-process "/usr/bin/espeak"  '-vzh nil  nil  nil   nil   content)
    ))

;;调用朗读软件朗读选区
(defun langdu(start end)
  "朗读开始和 end 区域的内容"
  (interactive "r")
  (let ((content (buffer-substring start end)))
    ;; (call-process "/usr/local/bin/ekho" nil t nil content)

    ;; (start-process NAME BUFFER PROGRAM &rest PROGRAM-ARGS)
    (start-process "ekho" nil "ekho" "-s100 " content)
    ))

;;打开智能配对开关
(spacemacs/toggle-smartparens-globally-on)

;;配置 tex 默认编译引擎
(add-hook 'LaTeX-mode-hook
          #'(lambda ()
              (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-default "XeLaTeX" )
              )
          )

;; (require 'conf-keybindings)
;; (require 'conf-mail)
;; (require 'conf-dired)
;; (require 'conf-theme)
(require 'conf-proxy)
(require 'conf-file)
(require 'conf-org)


;; 默认开代理
(proxy-http-enable)

;;有道词典
;; (require 'conf-dic)

(provide 'conf-general)
