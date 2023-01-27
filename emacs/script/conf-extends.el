(require 'html-to-markdown)
;; 翻译 start ======================================================
(require 'go-translate) 
;; 配置 

(setq gts-translate-list '(("en" "zh") ("en" "ja")))
;; 项目地址
;; https://github.com/lorniu/go-translate/blob/master/README-zh.md
;; 使用bing翻译和 google 翻译
(setq gts-default-translator
     (gts-translator
      :picker (gts-prompt-picker)
      :engines (list (gts-google-engine) (gts-bing-engine))
      :render (gts-buffer-render)))

;; 下面是渲染器
 ;;(gts-posframe-pop-render)
       ;;(gts-posframe-pop-render :backcolor "#333333" :forecolor "#ffffff")
       ;;(gts-posframe-pin-render)
       ;;(gts-posframe-pin-render :position (cons 1200 20))
       ;;(gts-posframe-pin-render :width 80 :height 25 :position (cons 1000 20) :forecolor "#ffffff" :backcolor "#111111")
       ;;(gts-kill-ring-render)

;; 快捷键
;; (global-set-key "\C-ct" 'go-translate)
;; (global-set-key "\C-cT" 'go-translate-popup)
;; (evil-leader/set-key "o ;" 'go-translate-popup)
(evil-leader/set-key "o h" 'gts-do-translate)
;; 翻译 end ======================================================



(provide 'conf-extends)
