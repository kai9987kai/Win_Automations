#Persistent
SetTitleMatchMode, 2

Gui, Add, Text,, Enter new title:
Gui, Add, Edit, vNewTitle
Gui, Add, Button, gSubmit, Submit
Gui, Show, , Set Window Title
return

Submit:
Gui, Submit
WinGet, id, list
Loop, %id%
{
    this_id := id%A_Index%
    WinSetTitle, ahk_id %this_id%, , %NewTitle%
}
return

GuiClose:
ExitApp
