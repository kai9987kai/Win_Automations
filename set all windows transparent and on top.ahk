#Persistent
SetTimer, ChangeWindowStyles, Off ; Off by default

Gui, Add, Button, gStart, Start
Gui, Add, Button, gStop, Stop
Gui, Show,, Change Window Styles

Start:
SetTimer, ChangeWindowStyles, 5000 ; Run every 5 seconds
return

Stop:
SetTimer, ChangeWindowStyles, Off ; Stop the timer
return

ChangeWindowStyles:
WinGet, windows, List ; Get a list of all windows
Loop, %windows%
{
    this_id := windows%A_Index%
    WinSet, AlwaysOnTop, On, ahk_id %this_id%
    WinSet, Transparent, 150, ahk_id %this_id%
}
return

GuiClose:
ExitApp
