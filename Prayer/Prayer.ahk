#SingleInstance Force
#Persistent
SetBatchLines, -1

DetectHiddenWindows, On
closeotherllars()

if (InStr(A_ScriptDir, ".zip" or ".rar") > 0) {
	Menu, Tray, NoIcon
	Gui Error: +LastFound +OwnDialogs +AlwaysOnTop
	Gui Error: Font, S13 bold underline cRed
	Gui Error: Add, Text, Center w220 x5,ERROR
	Gui Error: Add, Text, center x5 w220,
	Gui Error: Font, s12 norm bold
	Gui Error: Add, Text, Center w220 x5, Files Are Zipped
	Gui Error: Add, Text, center x5 w220,
	Gui Error: Font, cBlack
	Gui Error: Add, Text, Center w220 x5, Please extract all files from the zipped (.zip) folder:
	Gui Error: Font, underline s12
	Gui Error: Add, Text, cGreen center w220 x5, RuneScape-main.zip
	Gui Error: Font, s11 norm Bold c0x152039
	Gui Error: Add, Text, center x5 w220,
	Gui Error: Add, Text, Center w220 x5,Created by Gubna
	Gui Error: Add, Button, gDiscordError w150 x40 center,Discord
	Gui Error: add, button, gCloseError w150 x40 center,Close Error
	WinSet, ExStyle, ^0x80
	Gui Error: -caption
	Gui Error: Show, center w230, File Error
	return
}

if !FileExist("Config.ini")
{
	Menu, Tray, NoIcon
	Gui Error: +LastFound +OwnDialogs +AlwaysOnTop
	Gui Error: Font, S13 bold underline cRed
	Gui Error: Add, Text, Center w220 x5,ERROR
	Gui Error: Add, Text, center x5 w220,
	Gui Error: Font, s12 norm bold
	Gui Error: Add, Text, Center w220 x5, Config.ini not found
	Gui Error: Add, Text, center x5 w220,
	Gui Error: Font, cBlack
	Gui Error: Add, Text, Center w220 x5, Please ensure that you have all the original files from:
	Gui Error: Font, underline s12
	Gui Error: Add, Text, cBlue gGitLink center w220 x5, Gubna-Tech Github
	Gui Error: Font, s11 norm Bold c0x152039
	Gui Error: Add, Text, center x5 w220,
	Gui Error: Add, Text, Center w220 x5,Created by Gubna
	Gui Error: Add, Button, gDiscordError w150 x40 center,Discord
	Gui Error: add, button, gCloseError w150 x40 center,Close Error
	WinSet, ExStyle, ^0x80
	Gui Error: -caption
	Gui Error: Show, center w230, Config Error
	return
}

if !FileExist("LLARS Config.ini")
{
	Menu, Tray, NoIcon
	Gui Error: +LastFound +OwnDialogs +AlwaysOnTop
	Gui Error: Font, S13 bold underline cRed
	Gui Error: Add, Text, Center w220 x5,ERROR
	Gui Error: Add, Text, center x5 w220,
	Gui Error: Font, s12 norm bold
	Gui Error: Add, Text, Center w220 x5, LLARS Config.ini not found
	Gui Error: Add, Text, center x5 w220,
	Gui Error: Font, cBlack
	Gui Error: Add, Text, Center w220 x5, Please ensure that you have all the original files from:
	Gui Error: Font, underline s12
	Gui Error: Add, Text, cBlue gGitLink center w220 x5, Gubna-Tech Github
	Gui Error: Font, s11 norm Bold c0x152039
	Gui Error: Add, Text, center x5 w220,
	Gui Error: Add, Text, Center w220 x5,Created by Gubna
	Gui Error: Add, Button, gDiscordError w150 x40 center,Discord
	Gui Error: add, button, gCloseError w150 x40 center,Close Error
	WinSet, ExStyle, ^0x80
	Gui Error: -caption
	Gui Error: Show, center w230, Config Error
	return
}

IniRead, lhk1, LLARS Config.ini, LLARS Hotkey, start
IniRead, lhk2, LLARS Config.ini, LLARS Hotkey, coord/pause
IniRead, lhk3, LLARS Config.ini, LLARS Hotkey, config/resume
IniRead, lhk4, LLARS Config.ini, LLARS Hotkey, exit
IniRead, value, LLARS Config.ini, Transparent, value

settimer, configcheck, 250

scriptname := regexreplace(A_scriptname,"\..*","")

Hotkey %lhk1%, Start
Hotkey %lhk2%, coordb
Hotkey %lhk3%, Configb
Hotkey %lhk4%, exitb

Gui +LastFound +OwnDialogs +AlwaysOnTop
Gui, Font, s11
Gui, font, bold
Gui, Add, Button, x5 y5 w100 h25 gStart , Start
Gui, Add, Button, x115 y5 w100 h25 gInfo, Information
Gui, Add, Button, x5 y35 w100 h25 gCoordb , Coordinates
Gui, Add, Button, x115 y35 w100 h25 gConfigb , Hotkeys
Gui, Add, Button, x35 y140 w150 h25 gExitb , Exit LLARS
Gui, Add, Text, x135 y90 w100 h25 vCounter
Gui, Add, Text, x8 y90 w125 h25, Total Run Count
Gui, Add, Text, x8 y65 w125 h25, Run Count
Gui, Add, Text, x135 y65 w150 h25 vCounter2
Gui, Font, cGreen
Gui, Add, Text, x135 y115 w70 h25 vState1
Gui, Add, Text, x8 y115 w125 h25 vScriptGreen
Gui, Font, cBlue
Gui, Add, Text, x135 y115 w70 h25 vState3
Gui, Add, Text, x8 y115 w125 h25 vScriptBlue
Gui, Font, cRed
Gui, Add, Text, x135 y115 w70 h25 vState2
Gui, Add, Text, x8 y115 w125 h25 vScriptRed
GuiControl,,State2, ** OFF **
Gui, Add, Text, x8 y115 w125 h25, %scriptname%
if FileExist("LLARS Logo.ico")
{
	Menu, Tray, Icon, %A_ScriptDir%\LLARS Logo.ico
}
WinSet, Transparent, %value%
Gui, Show,w220 h170, LLARS

IniRead, x, LLARS Config.ini, GUI POS, guix
IniRead, y, LLARS Config.ini, GUI POS, guiy
WinMove A, ,%X%, %y%

if FileExist("LLARS Logo.ico")
{
	hIcon := DllCall("LoadImage", uint, 0, str, "LLARS Logo.ico"
   	, uint, 1, int, 0, int, 0, uint, 0x10)
	SendMessage, 0x80, 0, hIcon
	SendMessage, 0x80, 1, hIcon
}

coordcount = 0
frcount = 0

OnMessage(0x0047, "WM_WINDOWPOSCHANGED")
OnMessage(0x0201, "WM_LBUTTONDOWN")
WM_LBUTTONDOWN() {
	If (A_Gui)
		PostMessage, 0xA1, 2
}
return

WM_WINDOWPOSCHANGED() {
	If (A_Gui) {
		checkpos()
	}
}
return

ConfigError(){
	IniRead, x1, Config.ini, Bank Coords, xmin
	IniRead, x2, Config.ini, Bank Coords, xmax
	IniRead, y1, Config.ini, Bank Coords, ymin
	IniRead, y2, Config.ini, Bank Coords, ymax
	if (x1 = "" or x2 = "" or y1 = "" or y2 = "")
	{
		Run %A_ScriptDir%\Config.ini
		GuiControl,,ScriptRed, CONFIG		
		GuiControl,,State2, ERROR
		MsgBox, 4112, Config Error, Please enter valid coordinates for [Bank Coords] in the config.
		reload
	}
	
	IniRead, hkbank, Config.ini, Bank Preset, hotkey
	if (hkbank = "")
	{
		Run %A_ScriptDir%\Config.ini
		GuiControl,,ScriptRed, CONFIG		
		GuiControl,,State2, ERROR
		MsgBox, 4112, Config Error, Please enter a valid hotkey for [Bank Preset] in the config.
		reload
	}
	
	IniRead, hkdown, Config.ini, Skillbar Hotkey, hotkey
	if (hkdown = "")
	{
		Run %A_ScriptDir%\Config.ini
		GuiControl,,ScriptRed, CONFIG		
		GuiControl,,State2, ERROR
		MsgBox, 4112, Config Error, Please enter a valid hotkey for [Skillbar Hotkey] in the config.
		reload
	}
	
	IniRead, hkup, Config.ini, Skillbar Hotkey, hotkey
	if (hkup = "")
	{
		Run %A_ScriptDir%\Config.ini
		GuiControl,,ScriptRed, CONFIG		
		GuiControl,,State2, ERROR
		MsgBox, 4112, Config Error, Please enter a valid hotkey for [Skillbar Hotkey] in the config.
		reload
	}
	
	IniRead, option, Config.ini, Powder of burials, option
	if (%option% = true)
	{
		
		IniRead, hk, Config.ini, Powder of burials, hotkey
		if (hk = "")
		{
			Run %A_ScriptDir%\Config.ini
			GuiControl,,ScriptRed, CONFIG		
			GuiControl,,State2, ERROR
			MsgBox, 4112, Config Error, Please enter a valid hotkey for [Powder of burials] in the config.
			reload
		}
	}
	
	IniRead, option, Config.ini, Powder of burials, option
	if (%option% = true)
	{
		
		IniRead, hk, Config.ini, Powder of burials, bank preset
		if (hk = "")
		{
			Run %A_ScriptDir%\Config.ini
			GuiControl,,ScriptRed, CONFIG		
			GuiControl,,State2, ERROR
			MsgBox, 4112, Config Error, Please enter a valid bank preset for [Powder of burials] in the config.
			reload
		}
	}
	
	IniRead, option, Config.ini, Beast of Burden, option
	if (%option% = true)
	{
		
		IniRead, hk, Config.ini, Beast of Burden, bob icon hotkey
		if (hk = "")
		{
			Run %A_ScriptDir%\Config.ini
			GuiControl,,ScriptRed, CONFIG		
			GuiControl,,State2, ERROR
			MsgBox, 4112, Config Error, Please enter a valid hotkey for [bob icon hotkey] in the config.
			reload
		}
	}
	
	IniRead, option, Config.ini, Beast of Burden, option
	if (%option% = true)
	{
		
		IniRead, hk, Config.ini, Beast of Burden, bank preset
		if (hk = "")
		{
			Run %A_ScriptDir%\Config.ini
			GuiControl,,ScriptRed, CONFIG		
			GuiControl,,State2, ERROR
			MsgBox, 4112, Config Error, Please enter a valid bank preset for [bank preset] in the config.
			reload
		}
	}
	
	IniRead, option, Config.ini, Beast of Burden, option
	if (%option% = true)
	{
		
		IniRead, hk, Config.ini, Beast of Burden, bob hotkey
		if (hk = "")
		{
			Run %A_ScriptDir%\Config.ini
			GuiControl,,ScriptRed, CONFIG		
			GuiControl,,State2, ERROR
			MsgBox, 4112, Config Error, Please enter a valid hotkey for [bob hotkey] in the config.
			reload
		}
	}
	
	
	IniRead, option, Config.ini, Beast of Burden, option
	if (%option% = true)
	{
		
		IniRead, hk, Config.ini, Beast of Burden, restore pot hotkey
		if (hk = "")
		{
			Run %A_ScriptDir%\Config.ini
			GuiControl,,ScriptRed, CONFIG		
			GuiControl,,State2, ERROR
			MsgBox, 4112, Config Error, Please enter a valid hotkey for [restore pot hotkey] in the config.
			reload
		}
	}
	
	IniRead, option, Config.ini, Beast of Burden, option
	if (%option% = true)
	{
		
		IniRead, hk, Config.ini, Beast of Burden, bob timer
		if (hk = "")
		{
			Run %A_ScriptDir%\Config.ini
			GuiControl,,ScriptRed, CONFIG		
			GuiControl,,State2, ERROR
			MsgBox, 4112, Config Error, Please enter a valid time for [bob timer] in the config.
			reload
		}
	}
	
	IniRead, option, LLARS Config.ini, Logout, option
	if option=true
	{
		IniRead, x1, LLARS Config.ini, Logout, xmin
		IniRead, x2, LLARS Config.ini, Logout, xmax
		IniRead, y1, LLARS Config.ini, Logout, ymin
		IniRead, y2, LLARS Config.ini, Logout, ymax
		if (x1 = "" or x2 = "" or y1 = "" or y2 = "")
		{
			Run %A_ScriptDir%\LLARS Config.ini
			GuiControl,,ScriptRed, CONFIG		
			GuiControl,,State2, ERROR
			MsgBox, 4112, Config Error, Please enter valid coordinates in the LLARS Config for Logout.
			reload
		}
	}
}

CheckPOS() {
	allowedWindows := "|LLARS|hotkeys|coordinates|"
	
	WinGetTitle, activeWindowTitle, A
	
	if (InStr(allowedWindows, "|" activeWindowTitle "|") <= 0) {
		return
	}
	
	WinGetPos, GUIx, GUIy, GUIw, GUIh, A
	xmin := GUIx
	xmax := GUIw + GUIx
	ymin := GUIy
	ymax := GUIh + GUIy
	xadj := A_ScreenWidth - GUIw
	yadj := A_ScreenHeight - GUIh
	WinGetPos, X, Y,,, A    
	
	if (xmin < 0) {
		WinMove, A,, 0
	}
	if (ymin < 0) {
		WinMove, A,,, 0
	}
	if (xmax > A_ScreenWidth) {
		WinMove, A,, xadj    
	}
	if (ymax > A_ScreenHeight) {
		WinMove, A,,, yadj
	}
}

CloseOtherLLARS()
{
	WinGet, hWndList, List, LLARS
	
	Loop, %hWndList%
	{
		hWnd := hWndList%A_Index%
		WinClose, % "ahk_id " hWnd
	}
}

DisableHotkey(disable := true) {
	Control, Disable,, start
	IniRead, lhk1, LLARS Config.ini, LLARS Hotkey, start
	IniRead, lhk2, LLARS Config.ini, LLARS Hotkey, coord/pause
	IniRead, lhk3, LLARS Config.ini, LLARS Hotkey, config/resume
	IniRead, lhk4, LLARS Config.ini, LLARS Hotkey, exit
	Hotkey, %lhk1%, off	
	Hotkey, %lhk2%, off
	Hotkey, %lhk3%, off
	Hotkey, %lhk4%, off
}

EnableHotkey(enable := true) {
	Control, Enable,, start
	IniRead, lhk1, LLARS Config.ini, LLARS Hotkey, start
	IniRead, lhk2, LLARS Config.ini, LLARS Hotkey, coord/pause
	IniRead, lhk3, LLARS Config.ini, LLARS Hotkey, config/resume
	IniRead, lhk4, LLARS Config.ini, LLARS Hotkey, exit
	Hotkey, %lhk1%, on	
	Hotkey, %lhk2%, on
	Hotkey, %lhk3%, on
	Hotkey, %lhk4%, on
	
}

CoordB:
WinGetPos, GUIxc, GUIyc,,,LLARS
IniWrite, %GUIxc%, LLARS Config.ini, GUI POS, guix
IniWrite, %GUIyc%, LLARS Config.ini, GUI POS, guiy

Gui 1: Hide
Gui 2: +LastFound +OwnDialogs +AlwaysOnTop
Gui 2: Font, s11 Bold
DisableHotkey()

IniRead, allContents, Config.ini
excludedSections := "|Sleep Brief|Sleep Normal|Sleep Short|skillbar hotkey|bank preset|sleep prayer|sleep prayer extra|powder of burials|beast of burden|"

sectionList := " ***** Make a Selection ***** "

Loop, Parse, allContents, `n
{
    currentSection := A_LoopField

    if !InStr(excludedSections, "|" currentSection "|")
        sectionList .= "|" currentSection
}

Gui, 2: Add, DropDownList, w230 vSectionList Choose1 gDropDownChanged, % sectionList
Gui, 2: Add, Button, x52 w150 gClose, Close Coordinates

Gui, 2: Show, w250 h45 Center, Coordinates
Gui 2: -Caption
WinSet, ExStyle, ^0x80
WinSet, Transparent, %value%

return

Close:
Gui 2: Destroy
Gui 1: Show
EnableHotkey()
return

DropDownChanged:
GuiControlGet, selectedSection,, SectionList

if (selectedSection != " ***** Make a Selection ***** ")
	GoSub, ButtonClicked

return

ButtonClicked:
Gui, 2: Hide

WinActivate, RuneScape

ClickCount := 0
xmin := ""
ymin := ""
xmax := ""
ymax := ""

ButtonText := selectedSection

SetTimer, CheckClicks, 10

Gui 11u: +LastFound +AlwaysOnTop +OwnDialogs +Disabled
Gui 11u: Color, Red
Gui 11u: Font, cRed
Gui 11u: Font, s16 bold
Gui 11u: Add, Text, valertlabel center,----Right-click the top-left corner for [ %selectedSection% ]`n----
WinSet, ExStyle, ^0x80
Gui 11u: -caption
Gui 11u: Show, NoActivate xcenter y0,  BottomGUI

Gui 11: +LastFound +AlwaysOnTop +OwnDialogs +Disabled
Gui 11: Font, s16 bold
Gui 11: Add, Text, vTone center,Right-click the top-left corner for [ %selectedSection% ]
WinSet, ExStyle, ^0x80
Gui 11: -caption
Gui 11: Show, NoActivate xcenter y9999, TopGUI

wingetpos,,,,bottomH, BottomGUI
wingetpos,,,,topH, TopGUI

topPOS := (bottomH - topH) / 2

Gui, TopGUI: +LabelTopGUI
WinMove, TopGUI,, , %topPOS%
return

CheckClicks:
if GetKeyState("Esc", "P")
{
	Reload
}
if GetKeyState("RButton", "P")
{	
	MouseGetPos, MouseX, MouseY
	ClickCount++
	if (ClickCount = 1)
	{
		Gui 11: destroy
		Gui 11u: destroy
		
		Gui 12u: +LastFound +AlwaysOnTop +OwnDialogs +Disabled
		Gui 12u: Color, Red
		Gui 12u: Font, cRed
		Gui 12u: Font, s16 bold
		Gui 12u: Add, Text, valertlabel center,----Right-click the bottom-right corner for [ %selectedSection% ]`n----
		WinSet, ExStyle, ^0x80
		Gui 12u: -caption
		Gui 12u: Show, NoActivate xcenter y0, BottomGUI
		
		Gui 12: +LastFound +AlwaysOnTop +OwnDialogs +Disabled
		Gui 12: Font, s16 bold
		Gui 12: Add, Text, vTtwo center,Right-click the bottom-right corner for [ %selectedSection% ]
		WinSet, ExStyle, ^0x80
		Gui 12: -caption
		Gui 12: Show, NoActivate xcenter y9999, TopGUI
		
		Gui, TopGUI: +LabelTopGUI
		WinMove, TopGUI,, , %topPOS%
		
		xmin := MouseX
		ymin := MouseY
	}
	else if (ClickCount = 2)
	{
		Gui 12: destroy
		Gui 12u: destroy
		
		Gui 13u: +LastFound +AlwaysOnTop +OwnDialogs +Disabled
		Gui 13u: Color, Green
		Gui 13u: Font, cGreen
		Gui 13u: Font, s16 bold
		Gui 13u: Add, Text, valertlabel center,----Coordinates for [ %selectedSection% ] have been updated in the Config.ini file`n----
		WinSet, ExStyle, ^0x80
		Gui 13u: -caption
		Gui 13u: Show, NoActivate xcenter y0, BottomGUI
		
		Gui 13: +LastFound +AlwaysOnTop +OwnDialogs +Disabled
		Gui 13: Color, White
		Gui 13: Font, cGreen
		Gui 13: Font, s16 bold
		Gui 13: Add, Text, vTthree center,Coordinates for [ %selectedSection% ] have been updated in the Config.ini file
		WinSet, ExStyle, ^0x80
		Gui 13: -caption
		Gui 13: Show, NoActivate xcenter y9999, TopGUI
		
		Gui, TopGUI: +LabelTopGUI
		WinMove, TopGUI,, , %topPOS%
		
		xmax := MouseX
		ymax := MouseY
		SetTimer, CheckClicks, Off
		
		IniWrite, %xmin%, Config.ini, %ButtonText%, xmin
		IniWrite, %xmax%, Config.ini, %ButtonText%, xmax
		IniWrite, %ymin%, Config.ini, %ButtonText%, ymin
		IniWrite, %ymax%, Config.ini, %ButtonText%, ymax
		
		Sleep, 1500
		
		Gui 13: destroy
		Gui 13u: Destroy
		Gui, 2: Destroy
		Gui, 1: Show
		
		EnableHotkey()	
	}
	
	Sleep, 250
}
return

~Esc::
IfWinActive, Coordinates
{EnableHotkey()
GoSub, close
}
IfWinActive, Hotkeys
{EnableHotkey()	
GoSub, close2
}
IfWinActive, Information
{EnableHotkey()	
GoSub, closeinfo
}
Return

configB:
WinGetPos, GUIxc, GUIyc,,,LLARS
IniWrite, %GUIxc%, LLARS Config.ini, GUI POS, guix
IniWrite, %GUIyc%, LLARS Config.ini, GUI POS, guiy

Gui 1: Hide
Gui 3: +LastFound +OwnDialogs +AlwaysOnTop
Gui 3: Font, s11 Bold
DisableHotkey()

IniRead, allContents, Config.ini
excludedSections := "|Sleep Brief|Sleep Normal|Sleep Short|sleep prayer|sleep prayer extra|bank coords|beast of burden|"

sectionList := " ***** Make a Selection ***** "

Loop, Parse, allContents, `n
{
    currentSection := A_LoopField

    if !InStr(excludedSections, "|" currentSection "|")
        sectionList .= "|" currentSection
}

Gui, 3: Add, DropDownList, w230 vSectionList Choose1 gDropDownChanged2, % sectionList
Gui, 3: Add, Text, w230 vHotkeysText, Hotkeys will be displayed here
Gui, 3: Add, Hotkey, x97 y60 w60 vChosenHotkey gHotkeyChanged Center, ** NONE **
Gui, 3: Add, Button, x64 y90 w125 gClose2, Close Hotkeys

Gui, 3: Show, w250 h100 Center, Hotkeys
Gui 3: -Caption
WinSet, ExStyle, ^0x80
WinSet, Transparent, %value%
return

Close2:
Gui 3: Destroy
Gui 1: Show
EnableHotkey()
return

DropDownChanged2:
GuiControlGet, selectedSection,, SectionList

if (selectedSection != " ***** Make a Selection ***** ") {
	IniRead, existingHotkey, Config.ini, %selectedSection%, Hotkey
	GuiControl,, ChosenHotkey, %existingHotkey%
	GoSub, ButtonClicked2
}

return

ButtonClicked2:
if GetKeyState("Esc", "P")
{
	Reload
}
GuiControl,, HotkeysText, Enter new hotkey
GuiControl, Focus, ChosenHotkey
return

HotkeyChanged:
IniWrite, %ChosenHotkey%, Config.ini, %selectedSection%, Hotkey
Gui, 3: Destroy

Gui 13u: +LastFound +AlwaysOnTop +OwnDialogs +Disabled
Gui 13u: Color, Green
Gui 13u: Font, cGreen
Gui 13u: Font, s16 bold
Gui 13u: Add, Text, valertlabel center,----Hotkey has been updated in the Config.ini file`n----
WinSet, ExStyle, ^0x80
Gui 13u: -caption
Gui 13u: Show, NoActivate xcenter y0, BottomGUI

Gui 13: +LastFound +AlwaysOnTop +OwnDialogs +Disabled
Gui 13: Color, White
Gui 13: Font, cGreen
Gui 13: Font, s16 bold
Gui 13: Add, Text, vTthree center, Hotkey has been updated in the Config.ini file
WinSet, ExStyle, ^0x80
Gui 13: -caption
Gui 13: Show, NoActivate xcenter y9999, TopGUI

wingetpos,,,,bottomH, BottomGUI
wingetpos,,,,topH, TopGUI

topPOS := (bottomH - topH) / 2

Gui, TopGUI: +LabelTopGUI
WinMove, TopGUI,, , %topPOS%

Sleep 1500

Gui 13u: Destroy
Gui 13: Destroy
Gui 1: Show
EnableHotkey()
return

ResumeB:
GuiControl,,State3, Running
GuiControl,,ScriptBlue, %scriptname%
Pause
Return

PauseB:
GuiControl,,State2, Paused
GuiControl,,ScriptRed, %scriptname%
Pause
Return

Configcheck:
{
	IniRead, lhk1, LLARS Config.ini, LLARS Hotkey, start
	IniRead, lhk2, LLARS Config.ini, LLARS Hotkey, coord/pause
	IniRead, lhk3, LLARS Config.ini, LLARS Hotkey, config/resume
	IniRead, lhk4, LLARS Config.ini, LLARS Hotkey, exit
	
	Hotkey %lhk1%, Start
	Hotkey %lhk2%, coordb
	Hotkey %lhk3%, Configb
	Hotkey %lhk4%, exitb
}
return

Config2check:
{
	IniRead, lhk1, LLARS Config.ini, LLARS Hotkey, start
	IniRead, lhk2, LLARS Config.ini, LLARS Hotkey, coord/pause
	IniRead, lhk3, LLARS Config.ini, LLARS Hotkey, config/resume
	IniRead, lhk4, LLARS Config.ini, LLARS Hotkey, exit
	
	Hotkey %lhk1%, Start
	Hotkey %lhk2%, pauseb
	Hotkey %lhk3%, resumeb
	Hotkey %lhk4%, exitb
}
return

UpdateCountdown:
RemainingTime := EndTime - A_TickCount
if (RemainingTime > 0) {
	GuiControl,, State3, % RandomSleepAmountToMinutesSeconds(RemainingTime)
}
return

UpdateTime:
powdertime -= 1000
return

updatebob:
bobtime -=1000
return

RandomSleepAmountToMinutesSeconds(time) {
	minutes := Floor(time / 60000)
	seconds := Mod(Floor(time / 1000), 60)
	return minutes . "m " . seconds . "s"
}
return

DisableButton(disable := true) {
	Control, Disable,, start
	
	IniRead, lhk1, LLARS Config.ini, LLARS Hotkey, start
	Hotkey, %lhk1%, off
}

EnableButton(enable := true) {
	Control, Enable,, start
	
	IniRead, lhk1, LLARS Config.ini, LLARS Hotkey, start
	Hotkey, %lhk1%, On
}

ExitB:
guiclose:
WinGetPos, GUIxc, GUIyc,,,LLARS
IniWrite, %GUIxc%, LLARS Config.ini, GUI POS, guix
IniWrite, %GUIyc%, LLARS Config.ini, GUI POS, guiy
exitapp

Start:
IfWinNotExist RuneScape 
{
	Gui 1: Hide
	Gui GNF: +LastFound +OwnDialogs +AlwaysOnTop
	Gui GNF: Font, S13 bold underline cRed
	Gui GNF: Add, Text, Center w220 x5,ERROR
	Gui GNF: Add, Text, center x5 w220,
	Gui GNF: Font, s12 norm bold
	Gui GNF: Add, Text, Center w220 x5, RuneScape Not Found
	Gui GNF: Add, Text, center x5 w220,
	Gui GNF: Font, cBlack
	Gui GNF: Add, Text, Center w220 x5, RuneScape was not found to be running. Please try to start the script again once logged into an in-game world.`n`n`nIf RuneScape is open and you receive this message, please use the Discord button below to reach out to Gubna for assistance.`n`n`nRuneScape will be auto-launched upon closing this error message.
	Gui GNF: Font, s11 norm Bold c0x152039
	Gui GNF: Add, Text, center x5 w220,
	Gui GNF: Add, Text, Center w220 x5,Created by Gubna
	Gui GNF: Add, Button, gDiscordError w150 x40 center,Discord
	Gui GNF: add, button, gCloseGNF w150 x40 center,Close Error
	WinSet, ExStyle, ^0x80
	Gui GNF: -caption
	Gui GNF: Show, center w230, Game Not Found
	return
}
ConfigError()

InputBox, runcount, Run How Many Times?,,,250, 100
if (runcount = "" or runcount = 0)
{
	MsgBox, 48, Invalid Input, Please enter a valid number greater than 0.
	return
}

If (frcount = 0)
{
	SetTimer, ConfigCheck, off
	SetTimer, Config2Check, 250
	
	IniRead, lhk1, LLARS Config.ini, LLARS Hotkey, start
	IniRead, lhk2, LLARS Config.ini, LLARS Hotkey, coord/pause
	IniRead, lhk3, LLARS Config.ini, LLARS Hotkey, config/resume
	IniRead, lhk4, LLARS Config.ini, LLARS Hotkey, exit
	IniRead, value, LLARS Config.ini, Transparent, value
	
	Hotkey %lhk1%, Start
	Hotkey %lhk2%, pauseb
	Hotkey %lhk3%, resumeb
	Hotkey %lhk4%, exitb
	
	WinGetPos, X, Y,,, LLARS
	Gui destroy
	Gui +LastFound +OwnDialogs +AlwaysOnTop
	Gui, Font, s11
	Gui, font, bold
	Gui, Add, Button, x5 y5 w100 h25 gStart , Start
	Gui, Add, Button, x115 y5 w100 h25 gInfo, Information
	Gui, Add, Button, x5 y35 w100 h25 gPauseb , Pause
	Gui, Add, Button, x115 y35 w100 h25 gResumeb , Resume
	Gui, Add, Button, x35 y140 w150 h25 gExitb , Exit LLARS
	Gui, Add, Text, x135 y90 w65 h25 center vCounter
	Gui, Add, Text, x8 y90 w125 h25, Total Run Count
	Gui, Add, Text, x8 y65 w125 h25, Run Count
	Gui, Add, Text, x135 y65 w150 h25 vCounter2
	Gui, Font, cGreen
	Gui, Add, Text, x135 y115 w70 h25 vState1
	Gui, Add, Text, x8 y115 w125 h25 vScriptGreen
	Gui, Font, cBlue
	Gui, Add, Text, x135 y115 w70 h25 vState3
	Gui, Add, Text, x8 y115 w125 h25 vScriptBlue
	Gui, Font, cRed
	Gui, Add, Text, x135 y115 w70 h25 vState2
	Gui, Add, Text, x8 y115 w125 h25 vScriptRed
	GuiControl,,State2, ** OFF **
	Gui, Add, Text, x8 y115 w125 h25, %scriptname%
	if FileExist("LLARS Logo.ico")
	{
		Menu, Tray, Icon, %A_ScriptDir%\LLARS Logo.ico
	}
	WinSet, Transparent, %value%
	Gui, Show,w220 h170, LLARS
	WinMove, LLARS,, X, Y,
	
	count = 0
	++frcount
}

else
	
sleep 250

GuiControl,,ScriptBlue, %scriptname% 
GuiControl,,State3, Running

runcount3 = %runcount%
count2 = 0
StartTime := A_TickCount
StartTimeStamp = %A_Hour%:%A_Min%:%A_Sec%
sleepcount = 0
totalSleepTime := 0
prime = 0
bobprime = 0

loop % runcount
{ 
	++count
	++count2
	
	IfWinNotActive, RuneScape
	{
		WinActivate, RuneScape
	}

	GuiControl,,Counter, %count%
	GuiControl,,Counter2, %count2% / %runcount3%
	GuiControl,,ScriptBlue, %scriptname%
	GuiControl,,State3, Running
	DisableButton()
	
	IniRead, option, Config.ini, Powder of burials, option
	if (%option% = true)
		if prime=0
		{
			++prime
			CoordMode, Mouse, Window
			IniRead, x1, Config.ini, Bank Coords, xmin
			IniRead, x2, Config.ini, Bank Coords, xmax
			IniRead, y1, Config.ini, Bank Coords, ymin
			IniRead, y2, Config.ini, Bank Coords, ymax
			Random, x, %x1%, %x2%
			Random, y, %y1%, %y2%
			Click, %x%, %y%
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%
			
			IniRead, hkbank, Config.ini, Powder of burials, bank preset
			send {%hkbank%}
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%
			
			IniRead, hk, Config.ini, Powder of burials, hotkey
			send {%hk%}
			
			powdertime := 1800000
			settimer, UpdateTime, 1000
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%
		}
	
	IniRead, option, Config.ini, beast of burden, option
	if (%option% = true)
		if bobprime=0
		{
			++bobprime
			
			CoordMode, Mouse, Window
			IniRead, x1, Config.ini, Bank Coords, xmin
			IniRead, x2, Config.ini, Bank Coords, xmax
			IniRead, y1, Config.ini, Bank Coords, ymin
			IniRead, y2, Config.ini, Bank Coords, ymax
			Random, x, %x1%, %x2%
			Random, y, %y1%, %y2%
			Click, %x%, %y%
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%
			
			IniRead, hkbank, Config.ini, beast of burden, bank preset
			send {%hkbank%}
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%
			
			IniRead, hk, Config.ini, beast of burden, restore pot hotkey
			send {%hk%}
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%
			
			IniRead, hk, Config.ini, beast of burden, bob hotkey
			send {%hk%}
			
			IniRead, bobtimer, Config.ini, beast of burden, bob timer
			bobtime := (bobtimer * 60 * 1000)
			settimer, updatebob, 1000		
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%		
		}
	
	CoordMode, Mouse, Window
	IniRead, x1, Config.ini, Bank Coords, xmin
	IniRead, x2, Config.ini, Bank Coords, xmax
	IniRead, y1, Config.ini, Bank Coords, ymin
	IniRead, y2, Config.ini, Bank Coords, ymax
	Random, x, %x1%, %x2%
	Random, y, %y1%, %y2%
	Click, %x%, %y%
	
	IniRead, sa1, Config.ini, Sleep Short, min
	IniRead, sa2, Config.ini, Sleep Short, max
	Random, SleepAmount, %sa1%, %sa2%
	Sleep, %SleepAmount%
	
	IniRead, hkbank, Config.ini, Bank Preset, hotkey
	send {%hkbank%}
	
	IniRead, sa1, Config.ini, Sleep Short, min
	IniRead, sa2, Config.ini, Sleep Short, max
	Random, SleepAmount, %sa1%, %sa2%
	Sleep, %SleepAmount%
	
	IniRead, option, LLARS Config.ini, Random Sleep, option
	if option = true
	{
		IniRead, chance, LLARS Config.ini, Random Sleep, chance
		Random, RandomNumber, 1, 100
		
		if % RandomNumber <= chance
		{
			
			++sleepcount
			GuiControl,, ScriptBlue, Random Sleep
			GuiControl,, State3, % RandomSleepAmountToMinutesSeconds(RandomSleepAmount)
			
			IniRead, rs1, LLARS Config.ini, Random Sleep, min
			IniRead, rs2, LLARS Config.ini, Random Sleep, max
			Random, RandomSleepAmount, %rs1%, %rs2%
			
			SetTimer, UpdateCountdown, 1000
			EndTime := A_TickCount + RandomSleepAmount
			totalSleepTime += RandomSleepAmount
			Sleep, RandomSleepAmount
			SetTimer, UpdateCountdown, Off
			
			GuiControl,,ScriptBlue, %scriptname%
			GuiControl,,State3, Running
		}
	}
	
	IniRead, hkdown, Config.ini, Skillbar Hotkey, hotkey
	send {%hkdown% down}
	
	IniRead, sap1, Config.ini, Sleep Prayer, min
	IniRead, sap2, Config.ini, Sleep Prayer, max
	Random, SleepAmountPrayer, %sap1%, %sap2%
	Sleep, %SleepAmountPrayer%
	
	IniRead, hkup, Config.ini, Skillbar Hotkey, hotkey
	send {%hkup% up}
	
	IniRead, option, Config.ini, beast of burden, option
	if (%option% = true)
	{
		IniRead, sa1, Config.ini, Sleep Short, min
		IniRead, sa2, Config.ini, Sleep Short, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		IniRead, hk, Config.ini, beast of burden, bob icon hotkey
		send {%hk%}
		
		IniRead, sa1, Config.ini, Sleep Short, min
		IniRead, sa2, Config.ini, Sleep Short, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		IniRead, hkdown, Config.ini, Skillbar Hotkey, hotkey
		send {%hkdown% down}
		
		IniRead, sap1, Config.ini, Sleep Prayer Extra, min
		IniRead, sap2, Config.ini, Sleep Prayer Extra, max
		Random, SleepAmountPrayer, %sap1%, %sap2%
		Sleep, %SleepAmountPrayer%
		
		IniRead, hkup, Config.ini, Skillbar Hotkey, hotkey
		send {%hkup% up}
		
		IniRead, sa1, Config.ini, Sleep Brief, min
		IniRead, sa2, Config.ini, Sleep Brief, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
	}
	
	IniRead, option, Config.ini, beast of burden, option
	if (%option% = true)
		if (bobtime <= 60000)		
		{
			CoordMode, Mouse, Window
			IniRead, x1, Config.ini, Bank Coords, xmin
			IniRead, x2, Config.ini, Bank Coords, xmax
			IniRead, y1, Config.ini, Bank Coords, ymin
			IniRead, y2, Config.ini, Bank Coords, ymax
			Random, x, %x1%, %x2%
			Random, y, %y1%, %y2%
			Click, %x%, %y%
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%
			
			IniRead, hkbank, Config.ini, beast of burden, bank preset
			send {%hkbank%}
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%
			
			IniRead, hk, Config.ini, beast of burden, restore pot hotkey
			send {%hk%}
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%
			
			IniRead, hk, Config.ini, beast of burden, bob hotkey
			send {%hk%}
			
			IniRead, bobtimer, Config.ini, beast of burden, bob timer
			bobtime := (bobtimer * 60 * 1000)
			settimer, updatebob, 1000		
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%			
		}
	
	IniRead, option, Config.ini, Powder of burials, option
	if (%option% = true)
		if (powdertime <= 60000)
		{
			CoordMode, Mouse, Window
			IniRead, x1, Config.ini, Bank Coords, xmin
			IniRead, x2, Config.ini, Bank Coords, xmax
			IniRead, y1, Config.ini, Bank Coords, ymin
			IniRead, y2, Config.ini, Bank Coords, ymax
			Random, x, %x1%, %x2%
			Random, y, %y1%, %y2%
			Click, %x%, %y%
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%
			
			IniRead, hkbank, Config.ini, Powder of burials, bank preset
			send {%hkbank%}
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%
			
			IniRead, hk, Config.ini, Powder of burials, hotkey
			send {%hk%}
			
			powdertime := 1800000
			settimer, UpdateTime, 1000
			
			IniRead, sa1, Config.ini, Sleep Short, min
			IniRead, sa2, Config.ini, Sleep Short, max
			Random, SleepAmount, %sa1%, %sa2%
			Sleep, %SleepAmount%	
		}		
}
	
	IniRead, option, LLARS Config.ini, Logout, option
	if option=true
	{
		send {esc}	
		
		IniRead, sa1, Config.ini, Sleep Short, min
		IniRead, sa2, Config.ini, Sleep Short, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%	
		
		CoordMode, Mouse, Window
		IniRead, x1, LLARS Config.ini, Logout, xmin
		IniRead, x2, LLARS Config.ini, Logout, xmax
		IniRead, y1, LLARS Config.ini, Logout, ymin
		IniRead, y2, LLARS Config.ini, Logout, ymax
		Random, x, %x1%, %x2%
		Random, y, %y1%, %y2%
		Click, %x%, %y%
}

GuiControl,,ScriptGreen, %scriptname%
GuiControl,,State1, Finished

EndTimeStamp = %A_Hour%:%A_Min%:%A_Sec%
EndTime := A_TickCount
TotalTime := (EndTime - StartTime) / 1000
AverageTime := TotalTime / runcount3

TotalTimeHours := Floor(TotalTime / 3600)
TotalTimeMinutes := Mod(Floor(TotalTime / 60), 60)
TotalTimeSeconds := Mod(TotalTime, 60)

AverageTimeMinutes := Floor(AverageTime / 60)
AverageTimeSeconds := Mod(AverageTime, 60)

TotalTimeHours := Round(TotalTimeHours)
TotalTimeMinutes := Round(TotalTimeMinutes)
TotalTimeSeconds := Round(TotalTimeSeconds)
AverageTimeMinutes := Round(AverageTimeMinutes)
AverageTimeSeconds := Round(AverageTimeSeconds)

percentage := Round((sleepcount / runcount) * 100)

totalSleepTimeSeconds := Floor(totalSleepTime / 1000)
TotalSleepHours := Floor(totalSleepTimeSeconds / 3600)
TotalSleepMinutes := Floor(Mod(totalSleepTimeSeconds, 3600) / 60)
TotalSleepSeconds := Mod(totalSleepTimeSeconds, 60)

SoundPlay, C:\Windows\Media\Ring06.wav, 1
IniRead, chance, LLARS Config.ini, Random Sleep, chance
MsgBox, 64, LLARS Run Info, %scriptname% has completed %runcount3% runs`n`nTotal time: %TotalTimeHours%h : %TotalTimeMinutes%m : %TotalTimeSeconds%s`nAverage loop: %AverageTimeMinutes%m : %AverageTimeSeconds%s`n`nStart time: %starttimestamp%`nEnd time: %endtimestamp%`n`nSet chance: %chance%`%`nActual chance: %percentage%`%`nTotal random sleeps: %sleepcount%`nTotal time slept: %TotalSleepHours%h : %TotalSleepMinutes%m : %TotalSleepSeconds%s

EnableButton()
return

info:
DisableHotkey()
IniRead, lhk1, LLARS Config.ini, LLARS Hotkey, start
IniRead, lhk2, LLARS Config.ini, LLARS Hotkey, coord/pause
IniRead, lhk3, LLARS Config.ini, LLARS Hotkey, config/resume
IniRead, lhk4, LLARS Config.ini, LLARS Hotkey, exit
IniRead, logout, LLARS Config.ini, Logout, option
IniRead, sleepoption, LLARS Config.ini, Random Sleep, option
IniRead, chance, LLARS Config.ini, Random Sleep, chance
IniRead, hk, Config.ini, Skillbar Hotkey, hotkey
IniRead, hkbp, Config.ini, Bank Preset, hotkey
IniRead, hkpob, Config.ini, Powder of burials, hotkey

if (hk = "")
{
hk = Not Set
}
if (hkbp = "")
{
	hkbp = Not Set
}
if (hkpob = "")
{
	hkpob = Not Set
}

WinGetPos, GUIxc, GUIyc,,,LLARS
IniWrite, %GUIxc%, LLARS Config.ini, GUI POS, guix
IniWrite, %GUIyc%, LLARS Config.ini, GUI POS, guiy

Gui 1: hide
Gui 3: hide	
Gui 20: +AlwaysOnTop +OwnDialogs +LastFound
Gui 20: Font, S13 bold cMaroon
Gui 20: Add, Text, Center w220 x5,%scriptname%
Gui 20: Font, s11 Bold underline cTeal
Gui 20: Add, Text, Center w220 x5,[ Script Hotkeys ]
Gui 20: Font, Norm
Gui 20: Add, Text, Center w220 x5,Start: %lhk1%`nCoordinates/Pause: %lhk2%`nHotkey/Resume: %lhk3%`nExit: %lhk4%`nSkillbar: %hk%`nBank Preset: %hkbp%`nPowder of Burials: %hkpob%
Gui 20: Add, Text, center x5 w220,
Gui 20: Font, Bold underline cPurple
Gui 20: Add, Text, Center w220 x5,[ Additional Info ]
Gui 20: Font, Norm
Gui 20: Add, Text, Center w220 x5,Logout: %logout%`nRandom Sleep: %sleepoption%`nSleep Chance: %chance%`%
Gui 20: Font, s11 Bold c0x152039
Gui 20: Add, Text, center x5 w220,
Gui 20: Add, Text, Center w220 x5,Created by Gubna
Gui 20: Font, cBlue underline
Gui 20: Add, Text, Center gMIT w220 x5,MIT License
Gui 20: Font, cBlack norm bold
Gui 20: Add, Button, gInfoLLARS w150 x40 center,LLARS Config
Gui 20: Add, Button, gInfoConfig w150 x40 center,Script Config
Gui 20: Add, Button, gDiscord w150 x40 center,Discord
Gui 20: add, button, gCloseInfo w150 x40 center,Close Information
WinSet, ExStyle, ^0x80
Gui 20: -caption
Gui 20: Show, center w230, Information
return

CloseInfo:
EnableHotkey()
gui 20: destroy
gui 1: Show		
return

discord:
EnableHotkey()
Gui 20: destroy
Run, https://discord.gg/Wmmf65myPG
gui 1: Show		
return

InfoConfig:
EnableHotkey()
Run %A_ScriptDir%\Config.ini
return

InfoLLARS:
EnableHotkey()
Run %A_ScriptDir%\LLARS Config.ini
return

GitLink:
run, https://github.com/Gubna-Tech/RuneScape
Exitapp

DiscordError:
Run, https://discord.gg/Wmmf65myPG
Exitapp

CloseError:	
ExitApp

CloseGNF:
GUI GNF: Destroy
if FileExist("C:\Program Files (x86)\Jagex Launcher\JagexLauncher.exe") {
	if FileExist("C:\Program Files\Jagex\RuneScape Launcher\RuneScape.exe") {
		Menu, Tray, NoIcon
		Gui Client: +LastFound +OwnDialogs +AlwaysOnTop
		Gui Client: Font, S13 bold underline cRed
		Gui Client: Add, Text, Center w220 x5,ERROR
		Gui Client: Add, Text, center x5 w220,
		Gui Client: Font, s12 norm bold
		Gui Client: Add, Text, Center w220 x5, RuneScape and Jagex Launcher Both Found
		Gui Client: Add, Text, center x5 w220,
		Gui Client: Font, cBlack
		Gui Client: Add, Text, Center w220 x5, Please select below either RuneScape or Jagex to launch the appropraite client for you account.
		Gui Client: Add, Text, center x5 w220,
		Gui Client: Add, Button, gJagex w150 x40 center,Jagex
		Gui Client: Add, Button, gRuneScape w150 x40 center,RuneScape
		WinSet, ExStyle, ^0x80
		Gui Client: -caption
		Gui Client: Show, center w230, Multiple Client
		return
	} else {
		Gui 1: Show
		run "C:\Program Files (x86)\Jagex Launcher\JagexLauncher.exe"
	}
} else {
	Gui 1: Show
	run rs-launch://www.runescape.com/k=5/l=$(Language:0)/jav_config.ws
}
return

Jagex:
GUI Client: Destroy
Gui 1: Show
run "C:\Program Files (x86)\Jagex Launcher\JagexLauncher.exe"
return

RuneScape:
GUI Client: Destroy
Gui 1: Show
run rs-launch://www.runescape.com/k=5/l=$(Language:0)/jav_config.ws
return

MIT:
run https://github.com/Gubna-Tech/RuneScape/blob/main/LICENSE
return