(setq-default
 evil-escape-key-sequence "kj"
 evil-escape-delay 0.5
 ;; sdcv-popup-function 'popup-tip
 ;; sdcv-popup-function 'tooltip-show
 ;; sdcv-popup-function 'pos-tip-show
 ;;不发音
 sdcv-word-pronounce nil

 ;; google 翻译
 google-translate-default-source-language "en"
 google-translate-default-target-language "zh-CN"
 ;; google-translate-output-destination 'popup
 google-translate-show-phonetic nil
 ;;对于弹出buffer,是否获得焦点 
 google-translate-pop-up-buffer-set-focus t

 ;; 搜索
 eww-search-prefix "http://www.baidu.com/s?wd="

;;设置服务
 dotspacemacs-server-socket-dir "~/.emacs/server"

 paradox-github-token  "21c2b26b816706e094472ea4bbe1d683a373ff0e"
 )

;;search engine
(setq search-engine-config-list '((baidu
                                                        :name "baidu"
                                                        :url "http://www.baidu.com/s?wd=%s"
                                                        :keywords (:docstring "百度搜索"
                                                                              ;; :browser 'eww-browse-url
                                                                              ))))


;;ranger
(setq ranger-enter-with-minus 'ranger)
(setq ranger-show-literal nil)
(setq ranger-cleanup-eagerly t)
(setq ranger-parent-depth 0)
(setq ranger-ignored-extensions '("mkv" "iso" "mp4"))

;;python
(setq python-backend 'lsp)
(setq python-lsp-server 'mspyls)
(setq python-pipenv-activate t)
(setq python-lsp-git-root "~/soft/app/python-language-server")

;;dash
(setq dash-autoload-common-docsets nil)
(setq dash-docs-docset-newpath "~/.local/share/Zeal/Zeal/docsets")


;;easy-hugo
(use-package easy-hugo
:init
;; Main blog
(setq easy-hugo-basedir "~/blog/hugo/")
(setq easy-hugo-url "https://aming.xyz")
;; (setq easy-hugo-sshdomain "blogdomain")
(setq easy-hugo-root "/home/blog/")
(setq easy-hugo-previewtime "300")
(define-key global-map (kbd "C-c C-e") 'easy-hugo)

(setq easy-hugo-bloglist
	;; blog2 setting
	'(((easy-hugo-basedir . "~/src/github.com/masasam/hugo2/")
	(easy-hugo-url . "http://example2.com")
	(easy-hugo-sshdomain . "myblogdomain")
	(easy-hugo-root . "/home/hugo/"))
	;; blog3 setting for aws s3
	((easy-hugo-basedir . "~/src/github.com/masasam/hugo3/")
	(easy-hugo-url . "http://example3.net")
	(easy-hugo-amazon-s3-bucket-name . "yourS3bucketname"))
	;; blog4 setting for google cloud strage
	((easy-hugo-basedir . "~/src/github.com/masasam/hugo4/")
	(easy-hugo-url . "http://example4.net")
	(easy-hugo-google-cloud-storage-bucket-name . "yourGCPbucketname")
	(easy-hugo-image-directory . "img"))
	;; blog5 for github pages
	((easy-hugo-basedir . "~/src/github.com/masasam/githubpages/")
	(easy-hugo-url . "https://yourid.github.io"))
	;; blog6 for firebase hosting
	((easy-hugo-basedir . "~/src/github.com/masasam/firebase/")
	(easy-hugo-url . "https://yourproject.firebaseapp.com"))))
:bind ("C-c C-e" . easy-hugo))


;; 绑定微信小程序 文件模式
(setq auto-mode-alist (cons '("\\.wxml\\'" . web-mode)
                            auto-mode-alist))

(setq auto-mode-alist (cons '("\\.wxss\\'" . less-css-mode)
                            auto-mode-alist))


;;调用朗读软件朗读选区
(defun langdu(start end)
  "朗读开始和 end 区域的内容"
  (interactive "r")
  (let ((content (buffer-substring start end)))
    ;; (call-process "/usr/local/bin/ekho" nil t nil content)

    ;; (start-process NAME BUFFER PROGRAM &rest PROGRAM-ARGS)
    (start-process "ekho" nil "ekho" "-s20" "-a -80" content)
    ))

;;调用朗读软件朗读选区
(defun langdu-espeak(start end)
  (interactive "r")
  (let ((content (buffer-substring start end)))
    ;; (start-process NAME BUFFER PROGRAM &rest PROGRAM-ARGS)
    ;; (start-process "espeak" nil "espeak" "-vcmn" "-s 100"  "-a 20" content)
    (start-process "espeak" nil "espeak" "-ven" "-s 70"  "-a 20" "-m" content)
    ))

(server-start)
;; (require 'conf-custom)
;; (require 'conf-proxy)
(require 'conf-org)
(require 'conf-file)
(require 'conf-display)


;; 默认开代理
;; (proxy-http-enable)


(provide 'conf-general)
