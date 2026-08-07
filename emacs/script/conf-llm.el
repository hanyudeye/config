;; .authinfo 配置信息
;; machine api.deepseek.com login apikey password KEY
(use-package gptel
  :config
  ;; OPTIONAL configuration
  (setq gptel-api-key (auth-source-pick-first-password :host "api.deepseek.com"))
  (gptel-make-deepseek "DeepSeek"
    :stream t
    :models '(deepseek-v4-flash)
    :key gptel-api-key
    )

  (gptel-make-preset 'mycoding
    :description "写代码模式: deepseek + 严格系统提示"
    :system "你是一个专业代码助手，提供清洁，专业的代码输出."
    )

  (gptel-make-ollama "Ollama"
    ;; :host "192.168.110.162:11434"
    :host "localhost:11434"
    :stream t
    :models '(gemma4:e4b)
    )


  (setq
   ;; gptel-model 'gemma4:e4b
   gptel-backend (gptel-get-backend "DeepSeek")
   ;; gptel-backend (gptel-get-backend "Ollama")
   gptel-model 'deepseek-v4-flash
   gptel-include-reasoning nil
   )

  (setq ellama-language "China")
  (setq ellama-output-remove-reasoning t)
  ;; (setq ellama-translation-template)
  (setq ellama-show-reasoning nil)
  )

(use-package ellama
  :ensure t
  :bind ("C-c e" . ellama)
  :hook (org-ctrl-c-ctrl-c-hook . ellama-chat-send-last-message)
  :init (setopt ellama-auto-scroll t)
  :config
  (require 'llm-deepseek)
  (setq ellama-provider
        (make-llm-deepseek
         :key (auth-source-pick-first-password :host "api.deepseek.com")
         ;; :url "api.deepseek.com"
         ;; :key ellama-api-key
         :chat-model "deepseek-v4-flash"
         ;; :embedding-model "deepseek-v4-flash"
         )
        )
  (ellama-context-header-line-global-mode +1)
  (ellama-session-header-line-global-mode +1))

(provide 'conf-llm)
