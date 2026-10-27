;;; conf-self.el --- 自定义配置（个人环境相关） -*- lexical-binding: t; -*-

;;; Commentary:
;; 此文件放置与本机环境强相关的配置（路径、外部程序、浏览器等）。
;; 通用配置请放到 conf-common.el。

;;; Code:

;; ---- 浏览器 & 网页显示 ----
(setq-default
 ;; 浏览器设置：macOS 可用 'open，也可用 eww
 browse-url-browser-function 'eww-browse-url
 ;; eww 去除网页背景色，提升可读性
 shr-use-colors nil

 ;; ---- Shell ----
 ;; shell 默认用 vterm
 shell-default-shell 'vterm
 shell-pop-window-size 30)

;; ---- Org Agenda（个人路径）----
(with-eval-after-load 'org
  (setq org-agenda-files '("~/me/wo/living/time.org"))
  ;; 默认用日视图
  (setq org-agenda-span 'day))

;; ---- Treemacs：用外部程序打开特定文件 ----
(with-eval-after-load 'treemacs
  (treemacs-define-RET-action 'file-node-open
    (lambda (path &rest _)
      (cond
       ;; PDF 用外部程序打开（macOS 用 open）
       ((string-suffix-p ".pdf" path)
        (start-process "external-pdf" nil "open" path))
       ;; 音视频用外部程序打开（macOS 用 open）
       ((or (string-suffix-p ".mp3" path)
            (string-suffix-p ".mp4" path)
            (string-suffix-p ".m4a" path))
        (start-process "external-media" nil "open" path))
       ;; 其他文件走默认行为
       (t (find-file path))))))

;; ---- RSS 头部 ----
(setq elfeed-search-header-function #'elfeed-search--header)

(provide 'conf-self)
;;; conf-self.el ends here
