# -*- coding: utf-8 -*-
# 文件位置为：$PROFILE.CurrentUserAllHosts

# z.lua
Invoke-Expression (& { (lua C:\scoop\apps\z.lua\current\z.lua --init powershell) -join "`n" })

# alias
Set-Alias of start -Scope Global

# REF: https://www.cnblogs.com/sober-orange/p/powershell-shotkey-windows-terminal.html
Set-PSReadLineOption -EditMode Emacs #会改变按键行为
Set-PSReadLineKeyHandler -Chord Ctrl+i -Function TabCompleteNext
