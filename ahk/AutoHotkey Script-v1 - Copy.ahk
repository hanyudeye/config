;CapsLock::Ctrl 会导致ESC冲突，与日语输入法
;更稳健的写法
#InstallKeybdHook
#UseHook On
SetCapsLockState, AlwaysOff

SC03A::Ctrl


;切换虚拟桌面
#^;::Send #^{Right}
#^h::Send #^{Left}

;方向键代替
;#+j::Send,{Down}
;#+k::Send,{Up}
;#+h::Send,{Left}
;#+l::Send,{Right}

!j::Send,{Down}
!k::Send,{Up}
!h::Send,{Left}
!l::Send,{Right}

!d::  ; Alt + D
Send, {Delete}  ; 模拟按下 Delete 键
return

;这里配置给罗技鼠标的左侧功能键用，用来单手鼠标操作
;F9::Send, {Delete}

;使用 win+q 关闭窗口
#q::
{
	Send !{F4}
	return
}
;;通过程序名激活窗口
Active(t){
   WinActivate,ahk_exe %t%				
   return
}


; 定义通用函数
ToggleQuakeWindow(identifier, type = "class")
{
    ; 根据类型查找窗口
    if (type = "class")
        WinGet, windowID, ID, ahk_class %identifier%
    else if (type = "exe")
        WinGet, windowID, ID, ahk_exe %identifier%
    else
        WinGet, windowID, ID, %identifier%

    ; 如果窗口存在，就激活
    if (windowID)
    {
	  WinGet, windowState, MinMax, ahk_id %windowID%
        if (windowState)
	{
            WinRestore ahk_id %windowID%
            WinWait,ahk_id %windowID%
            WinActivate ahk_id %windowID%
	}   else
             WinActivate ahk_id %windowID%
      } 
}

;弹出式 窗口，像Quake那种的
ToggleQuakeWindowQuake(identifier, type = "class")
{
    ; 根据类型查找窗口
    if (type = "class")
        WinGet, windowID, ID, ahk_class %identifier%
    else if (type = "exe")
        WinGet, windowID, ID, ahk_exe %identifier%
    else
        WinGet, windowID, ID, %identifier%
    ; 如果窗口存在，则激活
    if (windowID)
    {
        	  WinGet, windowState, MinMax, ahk_id %windowID%

        if (windowState) ;如果窗口隐藏，则激活
	{
            WinRestore ahk_id %windowID%
            WinWait,ahk_id %windowID%
            WinActivate ahk_id %windowID%
	}  else {
            WinWait,ahk_id %windowID%
            WinMinimize ahk_id %windowID%
    } 
}
}


; 调用示例
; ToggleQuakeWindow("YourWindowClass", "class")
; ToggleQuakeWindow("YourWindowExe", "exe")
; ToggleQuakeWindow("YourWindowTitle", "title")


;资源管理器
#e::ToggleQuakeWindowQuake("CabinetWClass","class")
;#a::ToggleQuakeWindowQuake("Postman.exe","exe")
;#s::ToggleQuakeWindow("floorp.exe","exe")
#w::ToggleQuakeWindowQuake("Code.exe","exe")
#c::ToggleQuakeWindowQuake("Cursor.exe","exe")
;#x::ToggleQuakeWindow("firefox.exe","exe")
;剪印
#j::ToggleQuakeWindow("Qt622QWindowIcon","class")
#p::ToggleQuakeWindow("gimp-3.exe","exe")
#a::ToggleQuakeWindowQuake("msedge.exe","exe")
;#a::ToggleQuakeWindowQuake("irreader.exe","exe")
;f1::ToggleQuakeWindowQuake("WindowsTerminal.exe","exe")
#o::ToggleQuakeWindow("okular.exe","exe")
; visual studio devenv.exe
#m::ToggleQuakeWindowQuake("foobar2000.exe","exe")
;#m::ToggleQuakeWindow("PotPlayer64","class")
;#s::ToggleQuakeWindow("brave.exe","exe")
;#i::ToggleQuakeWindowQuake("Weixin.exe","exe")
#s::ToggleQuakeWindowQuake("chrome.exe","exe")

#n::
#z::ToggleQuakeWindowQuake("notepad.exe","exe")
;#i::ToggleQuakeWindowQuake("olk.exe","exe")
;#i::ToggleQuakeWindowQuake("OrpheusBrowserHost","class")
;用来自习
;#y::ToggleQuakeWindowQuake("douyin.exe","exe")
;#o::ToggleQuakeWindow("ApplicationFrameWindow","class")
;绘图，日历
;#c::ToggleQuakeWindowQuake("ComfyUI.exe","exe")
;朗读学习
#x::ToggleQuakeWindowQuake("TBalabolkaForm","class")
;豆包
;#s::ToggleQuakeWindowQuake("Doubao.exe","exe")
;#z::ToggleQuakeWindowQuake("Obsidian.exe","exe")

;股票
;#g::ToggleQuakeWindow("ntws.exe","exe")
;股票
;#u::ToggleQuakeWindow("FTNN.exe","exe")
;#p::ToggleQuakeWindow("pycharm64.exe","exe")
^Space::ToggleQuakeWindowQuake("ChatGPT.exe","exe")

; Win+F12 - Sleep
#F12::
{   
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
    Return
}


;^!s::  ; Ctrl + Alt + S 快捷键 关闭监视器
;Run, nircmd.exe monitor off
;return
