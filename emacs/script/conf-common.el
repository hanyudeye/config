;;; conf-common.el --- 通用配置（跨平台） -*- lexical-binding: t; -*-

;;; Commentary:
;; 此文件放置跨平台通用的配置。与个人路径、外部程序相关的配置请放到 conf-self.el。

;;; Code:

;; ---- Evil 逃逸键 ----
(setq-default
 evil-escape-key-sequence "kj"
 evil-escape-delay 0.5)

;; ---- 全局快捷键 ----
;; C-d 打开 treemacs
(evil-define-key '(normal insert visual emacs) global-map (kbd "C-d") 'treemacs)

;; Leader 键通用绑定
(with-eval-after-load 'spacemacs
  (spacemacs/set-leader-keys "o s" 'sdcv-search-pointer+)  ; 查词
  (spacemacs/set-leader-keys "o o" 'gptel-send))           ; 发送到 gptel

;; ---- sdcv：过滤输出并复制到 kill-ring ----
(with-eval-after-load 'sdcv
  (defun sdcv-filter (sdcv-string)
    "过滤 sdcv 输出：去除首行无用信息，并将翻译结果复制到 kill-ring。"
    (setq sdcv-string (replace-regexp-in-string sdcv-filter-string "" sdcv-string))
    (if (string-empty-p sdcv-string)
        sdcv-fail-notify-string
      (with-temp-buffer
        (insert sdcv-string)
        (goto-char (point-min))
        (kill-line 1)  ; 去掉首行说明
        (let ((result (buffer-string)))
          (kill-new result)
          result)))))

;; ---- 兼容 Emacs 29 ----
;; Emacs 29 移除了 frame-alpha-lower-limit，部分 Spacemacs 代码仍会用到
(defvar frame-alpha-lower-limit 20)

(provide 'conf-common)
;;; conf-common.el ends here
