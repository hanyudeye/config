;; C-c 复制选中区域到系统剪贴板
;; (global-set-key (kbd "C-c") 'kill-ring-save) 复制到了内部剪贴板
(global-set-key (kbd "C-c") 'spacemacs/xclipboard-copy)
;; C-v 粘贴
;; (global-set-key (kbd "C-v") 'yank)
;; C-x 剪切
;; (global-set-key (kbd "C-x") 'kill-region)

;; Evil 各个状态单独绑定（防止evil map覆盖global）
(evil-define-key '(normal insert visual emacs) global-map (kbd "C-c") 'spacemacs/xclipboard-copy)
;; (evil-define-key '(normal insert visual emacs) global-map (kbd "C-v") 'yank)
;; (evil-define-key '(normal insert visual emacs) global-map (kbd "C-x") 'kill-region)


;; 全局：C-d 打开 treemacs ,q 退出
(evil-define-key '(normal insert visual emacs) global-map (kbd "C-d") 'treemacs)

;; 同步系统剪贴板
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)

(provide 'conf-copy)
