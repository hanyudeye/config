#Requires AutoHotkey v2.0
#SingleInstance Force

; =========================
; AHK Prompt Panel v2
; Alt + Q 打开
; 点击按钮自动复制 Prompt
; =========================

global prompts := Map()

; =========================
; 中文 Prompt
; =========================

prompts["网页总结（中文）"] :=
(
"请总结网页内容：" "`n`n"
"要求：" "`n"
"1. 提炼最重要的信息" "`n"
"2. 不要废话" "`n"
"3. 不要 AI 味" "`n"
"4. 用中文输出" "`n"
"5. 给出重点列表" "`n"
"6. 给出值得关注的原因"
)

prompts["X 推文（中文）"] :=
(
"请把内容改写成适合 X（Twitter）发布的中文短帖：" "`n`n"
"要求：" "`n"
"1. 信息密度高" "`n"
"2. 有传播感" "`n"
"3. 不像营销号" "`n"
"4. 控制在 120 字左右" "`n"
"5. 保持真人表达感"
)

prompts["技术文章总结"] :=
(
"请总结技术文章：" "`n`n"
"输出：" "`n"
"- 核心问题" "`n"
"- 解决方案" "`n"
"- 技术亮点" "`n"
"- 是否值得普通开发者关注" "`n"
"- 用简单中文解释"
)

prompts["挣钱需要提高生产力"] :=
(
"请翻译成自然中文：" "`n`n"
"要求：" "`n"
"1. 保持原意" "`n"
"2. 不要机器翻译感" "`n"
"3. 适合中文阅读"
)

prompts["简化解释"] :=
(
"请用简单易懂的方式解释内容：" "`n`n"
"要求：" "`n"
"1. 像解释给普通人" "`n"
"2. 使用类比" "`n"
"3. 不使用复杂术语"
)

; =========================
; English Prompt
; =========================

prompts["Summarize Webpage"] :=
(
"Summarize the following webpage content." "`n`n"
"Requirements:" "`n"
"1. Extract the most important insights" "`n"
"2. Avoid fluff" "`n"
"3. Keep it concise" "`n"
"4. Use natural English" "`n"
"5. Include bullet points" "`n"
"6. Explain why it matters"
)

prompts["Rewrite for X"] :=
(
"Rewrite the following content into a high-quality X (Twitter) post." "`n`n"
"Requirements:" "`n"
"1. High information density" "`n"
"2. Human tone" "`n"
"3. No marketing language" "`n"
"4. Concise and engaging" "`n"
"5. Around 100-200 characters"
)

prompts["Tech Article Summary"] :=
(
"Summarize the following technical article." "`n`n"
"Output:" "`n"
"- Core problem" "`n"
"- Main solution" "`n"
"- Technical highlights" "`n"
"- Why developers should care" "`n"
"- Simple explanation"
)

prompts["Translate to English"] :=
(
"Translate the following content into natural English." "`n`n"
"Requirements:" "`n"
"1. Preserve original meaning" "`n"
"2. Native-like English" "`n"
"3. Avoid literal translation"
)

prompts["Explain Simply"] :=
(
"Explain the following content in a simple way." "`n`n"
"Requirements:" "`n"
"1. Beginner friendly" "`n"
"2. Use analogies" "`n"
"3. Avoid unnecessary jargon"
)

; =========================
; GUI
; =========================

;global myGui := Gui("+AlwaysOnTop", "AI Prompt Panel")
global myGui := Gui("", "AI Prompt Panel")

myGui.SetFont("s10")

for title, text in prompts
{
    btn := myGui.Add("Button", "w320 h35", title)
    btn.OnEvent("Click", CopyPrompt.Bind(text, title))
}

; =========================
; Hotkey
; =========================

!q::
{
    myGui.Show()
}

; =========================
; Copy Function
; =========================

CopyPrompt(text, title, *)
{
    A_Clipboard := text
    ToolTip("已复制: " title)

    SetTimer(() => ToolTip(), -1200)
}