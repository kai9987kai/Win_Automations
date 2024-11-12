#Persistent

; Initialize the GUI
Gui, Add, Text,, Click on a Window to Select It
Gui, Add, Button, gRemoveTitleBar, Remove Title Bar
Gui, Add, Button, gRestoreTitleBar, Restore Title Bar
Gui, Add, Button, gRefreshWindowList, Refresh List
Gui, Show, , Title Bar Control

; Variable to store the selected window ID
SelectedWindowID := ""

; Hotkey to select a window by clicking on it (Shift + Left Click)
~+LButton::
    ; Retrieve the ID of the window under the cursor
    MouseGetPos,,, SelectedWindowID, ControlUnderCursor
    
    ; Get the title of the selected window for display in GUI
    WinGetTitle, SelectedWindowTitle, ahk_id %SelectedWindowID%
    GuiControl,, SelectedWindowText, Selected Window: %SelectedWindowTitle%
    return

; Remove Title Bar Function
RemoveTitleBar:
    if (SelectedWindowID) {
        WinSet, Style, -0xC00000, ahk_id %SelectedWindowID%
    } else {
        MsgBox, Please select a window first by holding Shift and clicking on it.
    }
    return

; Restore Title Bar Function
RestoreTitleBar:
    if (SelectedWindowID) {
        WinSet, Style, +0xC00000, ahk_id %SelectedWindowID%
    } else {
        MsgBox, Please select a window first by holding Shift and clicking on it.
    }
    return

; Refresh Button Action (resets SelectedWindowID)
RefreshWindowList:
    SelectedWindowID := ""
    GuiControl,, SelectedWindowText, Selected Window: None
    return

; Handle GUI close action
GuiClose:
    ExitApp
