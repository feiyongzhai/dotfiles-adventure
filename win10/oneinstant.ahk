; @ref: https://www.cnblogs.com/west-link/archive/2011/10/08/2201804.html
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2    

Activate(t)
{
    ; IfWinActive, ahk_class %t%
    ; {
    ;   WinMinimize
    ;   return
    ; }
    SetTitleMatchMode 2    
    DetectHiddenWindows,on
    IfWinExist, %t%
    {
	WinShow
	WinActivate
	return 1
    }
    return 0
}

ActivateAndOpen(t,p)
{
    if Activate(t)==0
    {
	Run %p%
	WinActivate
	return
    }
}

global cnt := 0
ActivateAndOpenEmacs()
{
    if Activate("ahk_class Emacs")==0
    {
	if (cnt = 0) {
	    Run *runas C:/Program Files/Emacs/emacs-28.2/bin/emacsclientw.exe -a "" -c -e "(progn (switch-to-buffer nil) (raise-frame))"
	    WinActivate
	    cnt :=cnt + 1
	    ;msgbox % cnt
	}
	else
	{
	    run C:/Program Files/Emacs/emacs-28.2/bin/emacsclientw.exe -a "" -c -e "(progn (switch-to-buffer nil) (raise-frame))"
	    WinActivate
	}

	return
    }
}

CenterWindow(WinTitle)
{
    WinGetPos,,, Width, Height, %WinTitle%
    ; WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
    WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), 10
}

; #a::ActivateAndOpen("Microsoft Outlook","outlook.exe")
; #j::ActivateAndOpen("ahk_class Emacs","C:/Program Files/Emacs/emacs-28.2/bin/emacsclientw.exe -a """" -c -e ""(progn (switch-to-buffer nil) (raise-frame))""")
#j::ActivateAndOpen("ahk_class Emacs","C:/Program Files/Emacs/emacs-28.2/bin/runemacs.exe")
; #j::ActivateAndOpenEmacs()
; #o::ActivateAndOpen("Word","C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE")
; #a::ActivateAndOpen("Microsoft Outlook","outlook.exe")

#h::ActivateAndOpen("Cent Browser","C:\Users\22754\AppData\Local\CentBrowser\Application\chrome.exe")
; #h::ActivateAndOpen("- Microsoft​ Edge", "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe")
#[::ActivateAndOpen("ahk_class SDL_app","c:\scoop\apps\scrcpy\1.24\scrcpy-noconsole.vbs")
; #k::ActivateAndOpen("Windows PowerShell","powershell.exe")
#k::ActivateAndOpen("ahk_class CASCADIA_HOSTING_WINDOW_CLASS","wt.exe")
; #h::ActivateAndOpen("Google Chrome","C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
; #m::ActivateAndOpen("MATLAB R2021a","C:\Program Files\MATLAB\R2021a\bin\matlab.exe")
; #k::ActivateAndOpen("- Visual Studio Code","C:\Users\22754\AppData\Local\Programs\Microsoft VS Code\Code.exe")
; #k::Activate(" - Visual Studio Code")
; #c::Activate("UltraEdit")

#n::WinMinimize, A

; Others
; #[::^#Left
; #]::^#Right

#c::
WinGetActiveTitle, var_title
CenterWindow(var_title)
return

#IfWinActive ahk_class Emacs
^Space:: ^\

; #IfWinActive - Visual Studio Code
; #j::
; Send, !+e			;要在 vscode 中有相应的配置
; return
