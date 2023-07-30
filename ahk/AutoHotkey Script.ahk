; 修改 Caps 按键到 Control 键
; Change Caps Lock to Control when held down; otherwise, Escape
*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

*CapsLock up::
    Send {Blind}{Ctrl Up}
Return

;方向键代替
!j::Send,{Down}
!k::Send,{Up}
!h::Send,{Left}
!l::Send,{Right}

; wps pdf浏览设置
; #IfWinActive, ahk_class Chrome_WidgetWin_1
#IfWinActive, ahk_exe wps.exe
; j band to down
j::Send {Down}

k::Send {Up}
#IfWinActive

;使用 win+q 关闭窗口
#q::Send !{F4}
return

;;通过程序名激活窗口
Active(t){
   WinActivate,ahk_exe %t%
   return
}
 
;激活资源管理器
#e::WinActivate,ahk_class CabinetWClass
;微信
>!a::WinActivate,ahk_class WeChatMainWndForPC
;打开剪印
#j::WinActivate,ahk_class Qt622QWindowIcon

;打开pr
>!r::WinActivate,ahk_class Premiere Pro
;telegram
>!t::WinActivate,ahk_class Qt5158QWindowIcon
;激活edge
#w::Active("msedge.exe")
;激活WindowsTerminal.exe
>!z::
#z::Active("WindowsTerminal.exe")
;激活okular.exe
#o::Active("okular.exe")
;激活copytranslator.exe
#y::Active("copytranslator.exe")

;激活ChatGPT.exe
f1::Active("ChatGPT.exe")

;激活chrome
>!w::
#+w::Active("chrome.exe")
;激活code Lilun
>!c::
#c::
WinTitle=ahk_class Chrome_WidgetWin_1
WinGet, winList,List,%WinTitle%
wins:=[]
Loop,%winList%
{
    this_id=% winList%A_Index%
    WinGetTitle,this_title,ahk_id %this_id%
    wins.Insert({index:A_Index,title:this_title,id:this_id})
}

for each,win in wins
{

   if InStr(win.title,"Lilun")
		{
			main_id:=win.id
			WinActivate,ahk_id %main_id%
		}
}
return

;激活code Shijian

#s::
WinTitle=ahk_class Chrome_WidgetWin_1
WinGet, winList,List,%WinTitle%
wins:=[]
Loop,%winList%
{
    this_id=% winList%A_Index%
    WinGetTitle,this_title,ahk_id %this_id%
    wins.Insert({index:A_Index,title:this_title,id:this_id})
}

for each,win in wins
{

   if InStr(win.title,"Shijian")
		{
			main_id:=win.id
			WinActivate,ahk_id %main_id%
		}
}
return


;学习界面，可以动态改动
#+c::
WinTitle=ahk_class Chrome_WidgetWin_1
WinGet, winList,List,%WinTitle%
wins:=[]
Loop,%winList%
{
    this_id=% winList%A_Index%
    WinGetTitle,this_title,ahk_id %this_id%
    wins.Insert({index:A_Index,title:this_title,id:this_id})
}

for each,win in wins
{

   if InStr(win.title,"txt")
		{
			main_id:=win.id
			WinActivate,ahk_id %main_id%
		}
}
return

