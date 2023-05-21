#Persistent
SetTimer, RenameWindows, 1000
return

RenameWindows:
WinGet, id, list
Loop, %id%
{
    this_id := id%A_Index%
    WinSetTitle, ahk_id %this_id%, , Hello World
}
return
