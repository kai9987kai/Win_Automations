#Persistent
SetTitleMatchMode, 2

Gui, Add, Text,, Enter directory:
Gui, Add, Edit, vDirectory
Gui, Add, Text,, Enter prefix:
Gui, Add, Edit, vPrefix
Gui, Add, Button, gSubmit, Submit
Gui, Show, , Mass Rename Files
return

Submit:
Gui, Submit
Loop, %Directory%\*.*
{
    FileMove, %A_LoopFileFullPath%, %Directory%\%Prefix%%A_LoopFileName%
}
return

GuiClose:
ExitApp
