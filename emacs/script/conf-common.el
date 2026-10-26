;; 这个文件添加公共的，各平台通用的配置，自定义的放在 conf-self 文件里面

;; 全局：C-d 打开 treemacs ,q 退出
(evil-define-key '(normal insert visual emacs) global-map (kbd "C-d") 'treemacs)

(provide 'conf-common)
