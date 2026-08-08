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

  ;; (gptel-make-preset '课程学习
  ;;   :description "输入某项专业技能，然后输入继续"
  ;;   :system "给我一个学习某项专业知识的提示词，每次给我一些任务节点，不给我答案，当我学习完成，我会输入'继续' ，那你再往下给我一些任务节点，直到最终我把这个专项课程学习完。下面，你先问我要学什么专项课程，我输入课程名称后你给我一些任务，然后你按上面指令形式，响应我的输入'继续'"
  ;;   )

  (gptel-make-preset '英译中
    :system "你是专业译者,将用户输入翻译成通顺的简体中文,只输出译文,不要解释。")
  (gptel-make-preset '中译英
    :system "You are a professional translator. Translate the user's text into natural English. Output only the translation.")

  ;; (setq gptel-default-preset 'mycoding)

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

  ;; 关闭非自由软件警告
  (setq llm-warn-on-nonfree nil)
  (ellama-context-header-line-global-mode +1)
  (ellama-session-header-line-global-mode +1))


(spacemacs/set-leader-keys "o c" 'ellama-translate)

(provide 'conf-llm)
