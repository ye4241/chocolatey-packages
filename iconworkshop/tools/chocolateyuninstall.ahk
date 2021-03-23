#NoEnv
#NoTrayIcon
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode, Fast
DetectHiddenText, Off
DetectHiddenWindows, Off

winTitle = ahk_class #32770

WinWait, %winTitle%, Axialis IconWorkshop, 120
WinActivate
Send,{Enter}

WinWait, %winTitle%, Uninstallation Successfully Completed, 120
WinActivate
Send,{Enter}

ExitApp