(require 'go-translate) 
;; 项目地址
;; https://github.com/lorniu/go-translate/blob/master/README-zh.md

(setq gts-translate-list '(("en" "zh")))
;; (setq gts-translate-list '(("en" "zh") ("en" "ja")))
;; 使用bing翻译和 google 翻译
(setq gts-default-translator
     (gts-translator
      :picker (gts-prompt-picker)
      :engines (list
                (gts-bing-engine)
                ;; (gts-google-engine)
                ;; (gts-google-rpc-engine)
                ;; (gts-youdao-dict-engine)
                ;; (gts-stardict-engine)
                )
      :render (gts-buffer-render)))

(evil-leader/set-key "o h" 'gts-do-translate)


(provide 'conf-extends)
