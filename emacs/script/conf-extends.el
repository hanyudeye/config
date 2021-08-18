(require 'html-to-markdown)
;; 翻译 start ======================================================
(require 'go-translate) 
;; 配置 

(setq go-translate-local-language "zh-CN")
(setq go-translate-base-url "https://translate.google.cn")
(setq go-translate-token-current (cons 430675 2721866130))
;; (setq go-translate-buffer-follow-p t)       ; 翻译完成后，总是将光标切换到翻译结果窗口
;; (setq go-translate-buffer-source-fold-p t)  ; 在结果页面，折叠源文本。可以通过回车或鼠标点击展开
;; (setq go-translate-buffer-line-wrap-p nil)  ; 在结果页面，不允许过长的行折行显示
;; (setq go-translate-buffer-window-config ..) ; 更改翻译窗口的位置和样式

;; 设置输入风格。默认情况下，是通过 Minibuffer 方式补全用户输入
;; 可以修改为 `go-translate-inputs-noprompt` 或 `go-translate-inputs-current-or-prompt`
;; 前者表示直接翻译选中内容或光标下单词；后者表示若光标下没内容则打开 Minibuffer 读取内容
(setq go-translate-inputs-function #'go-translate-inputs-current-or-prompt)

;; 快捷键
(global-set-key "\C-ct" 'go-translate)
(global-set-key "\C-cT" 'go-translate-popup)
(evil-leader/set-key "o ;" 'go-translate-popup)
(evil-leader/set-key "o h" 'go-translate)
;; 翻译 end ======================================================



(provide 'conf-extends)
