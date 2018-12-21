; 此脚本实现了给 EveryOne Piano 增加简单的“播放列表”功能。脚本提供了三个快捷键：
;    * Ctrl+Alt+P , 播放前一首 (Previous)
;    * Ctrl+Alt+N , 播放后一首 (Next)
;    * Ctrl+Alt+R , 随机播放 (Random)
;
; 在使用此脚本前，需要
;    1. 将下载的 .eop 文件放在一个目录下。如：D:\music\eop
;    2. 在该目录下，创建一个名为  playlist.txt 的文本文件。
;       文件的每一行是一个需要播放的 .eop 文件名。如：女儿情简单版-西游记插曲.eop
;    3. 在 EOP 主程序中，先手工打开一个 .eop 文件（目的是让 EOP 程序的文件打开目录切换到指定的目录）
;    4. 将此脚本放置在 AutoHotkey 的安装目录下
;
; 最后需要注意: 必须使用 管理员权限运行 AutoHotkey 。
;    即，在资源管理器中，选中 AutoHotkey.exe ，在鼠标右键菜单中选择“以管理员身份运行”。

global PlayList = []   ; 定义全局变量（待播放的EOP文件列表）

LoadPlayList()
{
	PlayListFileName := "D:\music\eop\playlist.txt"  ; 将路径修改成自己的
	
	index=1
	Loop
	{
		FileReadLine, line, %PlayListFileName%, %index%
		if ErrorLevel
		{
			break  ; MsgBox % "Error at line " index
		}
		PlayList.Push(line)
		index := index+1
	}
	; MsgBox % "PlayList " PlayList.Length() " is: " PlayList[PlayList.Length()]
}

LoadPlayList()

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

PlayEopFile(interval)
{
	if !WinExist("ahk_exe EveryonePiano.exe") {
		MsgBox EveryonePiano 没有启动
		return
	}
	
	static index := 1
	index := index + interval
	if (index > PlayList.Length()) {
		index := index - PlayList.Length()
	} else if (index < 1) {
		index := index + PlayList.Length()
	}
	eopFileName := PlayList[index]
	
	; 播放指定的 EOP 文件
	WinActivate, ahk_exe EveryonePiano.exe
	ControlClick, Button6, EveryonePiano
	Sleep, 500
	SendInput {Blind}{Text}%eopFileName%
	Sleep, 500
	ControlClick, Button1, 请选择要打开的曲目
}

^!p::     ; Ctrl+Alt+P , 播放前一首 (Previous)
	PlayEopFile(-1)
return

^!n::     ; Ctrl+Alt+N , 播放后一首 (Next)
	PlayEopFile(1)
return

^!r::     ; Ctrl+Alt+R , 随机播放 (Random)
	Random, interval, 1, PlayList.Length()
	PlayEopFile(interval)
return
