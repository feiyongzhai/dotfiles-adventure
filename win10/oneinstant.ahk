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

CenterWindow(WinTitle)
{
    WinGetPos,,, Width, Height, %WinTitle%
    ; WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
    WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), 10
}

; #a::ActivateAndOpen("Microsoft Outlook","outlook.exe")
#j::ActivateAndOpen("ahk_class Emacs","C:/Program Files/Emacs/emacs-28.1/bin/emacsclientw.exe -a """" -c -e ""(switch-to-buffer nil)""")
#o::ActivateAndOpen("Word","C:/Program Files/Emacs/emacs-28.1/bin/emacsclientw.exe -a """" -c -e ""(switch-to-buffer nil)""")
; #a::ActivateAndOpen("Microsoft Outlook","outlook.exe")

#h::ActivateAndOpen("Cent Browser","C:\Users\22754\AppData\Local\CentBrowser\Application\chrome.exe")
#k::ActivateAndOpen("MATLAB R2021a","C:\Program Files\MATLAB\R2021a\bin\matlab.exe")
; #k::ActivateAndOpen("Visual Studio Code","C:\Users\22754\AppData\Local\Programs\Microsoft VS Code\Code.exe")
; #k::Activate(" - Visual Studio Code")
; #c::Activate("UltraEdit")

; Others
#[::^#Left
#]::^#Right

#c::
WinGetActiveTitle, var_title
CenterWindow(var_title)
return

