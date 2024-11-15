(setq-default
 evil-escape-key-sequence "kj"
 evil-escape-delay 0.5
 ;; sdcv-popup-function 'popup-tip
 ;; sdcv-popup-function 'tooltip-show
 ;; sdcv-popup-function 'pos-tip-show
 ;;不发音
 ;; sdcv-word-pronounce nil

 ;; google 翻译
 google-translate-default-source-language "en"
 google-translate-default-target-language "zh-CN"
 ;; google-translate-output-destination 'popup
 google-translate-show-phonetic nil
 ;;对于弹出buffer,是否获得焦点 
 google-translate-pop-up-buffer-set-focus t

;; go 翻译
 go-translate-token-current (cons 730153 730153)

 ;; 搜索
 eww-search-prefix "http://www.baidu.com/s?wd="

;;设置服务
;; dotspacemacs-server-socket-dir "~/.emacs/server"

 paradox-github-token  "21c2b26b816706e094472ea4bbe1d683a373ff0e"
 ;; sdcv 词典配置
 sdcv-word-pronounce nil
 ;; sdcv-word-pronounce t
 sdcv-popup-function 'popup-tip
 ;; sdcv-popup-function 'pos-tip-show
 eww-search-prefix "https://bing.com/search?q="
 sdcv-fail-notify-string nil

 ;; 解压缩
 nov-unzip-program (executable-find "d:/Program Files/Git/usr/bin/unzip.exe")
)

;; 取消光标所在行的高亮
(global-hl-line-mode -1)

; (package-install 'keycast)

;;search engine
(setq search-engine-config-list '((baidu
                                                        :name "baidu"
                                                        :url "http://www.baidu.com/s?wd=%s"
                                                        :keywords (:docstring "百度搜索"
                                                                              ;; :browser 'eww-browse-url
                                                                              ))))

;; (setq sdcv-popup-function 'popup-tip)
;; ;;search engine
;; (setq search-engine-config-list '((baidu
;;                                      :name "baidu"
;;                                      :url "http://www.baidu.com/s?wd=%s"
;;                                      :keywords (:docstring "百度搜索"
;;                                                            ;; :browser 'eww-browse-url
;;                                                            ))))
;;ranger
(setq ranger-enter-with-minus 'ranger)
(setq ranger-preview-file t)
(setq ranger-show-literal nil)
(setq ranger-deer-show-details nil)
(setq ranger-cleanup-eagerly t)
(setq ranger-parent-depth 0)
(setq ranger-ignored-extensions '("mkv" "iso" "mp4"))
(setq ranger-override-dired 'ranger)
(setq ranger-max-preview-size 3)
(setq ranger-dont-show-binary t)

(global-set-key "\M-n" 'ranger-next-tab)
(global-set-key "\M-p" 'ranger-prev-tab)


;;python
;; (setq python-backend 'lsp)
;; (setq python-lsp-server 'mspyls)
;; (setq python-pipenv-activate t)
;; (setq python-lsp-git-root "~/soft/app/python-language-server")

;;dash
;; (setq dash-autoload-common-docsets nil)
;; (setq dash-docs-docset-newpath "~/.local/share/Zeal/Zeal/docsets")

;;snippet
;; (setq my-snippet "/home/wuming/.spacemacs.d/snippets")
;; (add-to-list 'yas-snippet-dirs my-snippet)

;; 绑定微信小程序 文件模式
(setq auto-mode-alist (cons '("\\.wxml\\'" . web-mode)
                            auto-mode-alist))

(setq auto-mode-alist (cons '("\\.wxss\\'" . less-css-mode)
                            auto-mode-alist))

;; OPTIONAL configuration
(setq
 gptel-model "llama3"
 gptel-backend (gptel-make-ollama "Ollama"
                                  :host "localhost:11434"
                                  :stream t
                                  :models '("llama3")))

;; (defun find-org-passwd()
;;   (interactive)
;;   (find-file "/home/wuming/me/config/passwd/passwd.org")
;;   )

;; (evil-leader/set-key "o o p" 'find-org-passwd)
;;sdcv 翻译
(evil-leader/set-key "o s" 'sdcv-search-pointer+)

;; (server-start)
;; (require 'conf-custom)
;; (require 'conf-proxy)
;; (require 'conf-org)
;; (require 'conf-file)
;; (require 'conf-display)
;; (require 'conf-key)
(require 'conf-rime)

;; 加载扩展
(require 'conf-extends)
;;(require 'conf-agenda)
;; 默认开代理
;;(proxy-http-enable)
(provide 'conf-general)
