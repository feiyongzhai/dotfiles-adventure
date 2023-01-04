# -*- coding: utf-8 -*-
# 文件位置为：$PROFILE.CurrentUserAllHosts

# z.lua
# Invoke-Expression (& { (lua C:\scoop\apps\z.lua\current\z.lua --init powershell) -join "`n" })

# alias
Set-Alias of start -Scope Global

# REF: https://www.cnblogs.com/sober-orange/p/powershell-shotkey-windows-terminal.html
Set-PSReadLineOption -EditMode Emacs #会改变按键行为
Set-PSReadLineKeyHandler -Chord Ctrl+i -Function TabCompleteNext

# zoxide
Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --hook $hook | Out-String) })
# REF: https://stackoverflow.com/questions/49476326/displaying-unicode-in-powershell/49481797#49481797
# See Also:
# https://stackoverflow.com/questions/40098771/changing-powershells-default-output-encoding-to-utf-8
# 这个配置和 emacs 的设置是一致的，emacs中的设置如下：
# (modify-coding-system-alist 'process "zoxide" '(utf-8 . chinese-gbk-dos))
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
