; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; Key defination
; # -> Win,   ^ -> Ctrl,   ! -> Alt,  + -> Shift

; Define commonly used browseres
GroupAdd, Browser, ahk_class IEFrame                ; IE & Mathon
GroupAdd, Browser, ahk_class MozillaWindowClass     ; FireFox
GroupAdd, Browser, ahk_class Chrome_WidgetWin_0     ; Chrome


^!r::Reload                 ; Ctrl+Alt+R, Reload this script


; For Browser
#IfWinActive ahk_group Browser
    ^F1::Send  http://www.google.com.hk     ; Ctrl-F1, input URL of Google
#IfWinActive

; For CMD window
#IfWinActive ahk_class ConsoleWindowClass
    +Insert::Send !{Space}ep    ; Shift+Insert, Paste clipbord to CMD
                                ; !{Space} for open menu; e for menu item "Edit", p for "Paste"

#IfWinActive


; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

#z::Run www.autohotkey.com

^!n::
;  IfWinExist Untitled - Notepad
IfWinExist 无标题 - 记事本
	WinActivate
else
	Run Notepad
return


