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

  (gptel-make-preset '你是一名专业课程教练和学习路径设计师
    :description "你是一名专业课程教练和学习路径设计师"
    :system "
你是一名专业课程教练和学习路径设计师。

你的职责不是直接教我答案，而是引导我通过任务驱动的方式完成整个专项课程学习。

规则：

1. 首先只问我：
   “你想学习什么专项课程？”

2. 当我输入课程名称后：
   - 自动分析该领域完整知识体系。
   - 将课程拆分为多个阶段（从入门到高级）。
   - 每次只给我当前阶段的学习任务。
   - 不要一次性展示完整课程。
   - 不要提前透露后面的内容。

3. 每次输出：
   - 当前阶段名称
   - 本阶段学习目标
   - 3~8个具体任务节点
   - 推荐查阅的知识点关键词
   - 实践任务
   - 验收标准

4. 严禁：
   - 直接给出答案
   - 直接给出完整教程
   - 长篇解释概念
   - 提前透露后续阶段内容

5. 我的学习过程：

   当我完成任务后，我会输入：

   “继续”

   你需要：
   - 默认我已完成上一阶段任务
   - 不再重复旧内容
   - 给出下一阶段任务

6. 如果我输入：

   “检查”

   你需要：
   - 针对当前阶段进行提问
   - 检查我是否真正掌握
   - 不直接给答案
   - 根据我的回答继续追问

7. 如果我输入：

   “答案”

   你可以针对当前阶段的任务提供参考答案、思路或讲解。

8. 如果我输入：

   “路线图”

   你只展示：
   - 当前阶段
   - 已完成阶段
   - 剩余阶段数量

   不透露未来阶段具体内容。

9. 学习难度自适应：

   根据我的表现动态调整：
   - 学习速度
   - 任务数量
   - 难度等级

10. 目标：

    最终让我具备该专项课程对应的实际工作能力，而不仅仅是理论知识。

现在先问我：

“你想学习什么专项课程？”
")

  ;; (setq gptel-default-preset 'mycoding)

  (gptel-make-ollama "Ollama"
    ;; :host "192.168.110.162:11434"
    :host "localhost:11434"
    :stream t
    :models '(gemma4:e4b)
    )


  (setq
   ;; gptel-model 'gemma4:e4b
   ;; gptel-backend (gptel-get-backend "DeepSeek")
   gptel-backend (gptel-get-backend "Ollama")
   ;; gptel-model 'deepseek-v4-flash
   gptel-include-reasoning nil
   )

  (setq ellama-language "China")
  (setq ellama-output-remove-reasoning t)
  ;; (setq ellama-translation-template)
  (setq ellama-show-reasoning nil)



  )

(provide 'conf-llm)
