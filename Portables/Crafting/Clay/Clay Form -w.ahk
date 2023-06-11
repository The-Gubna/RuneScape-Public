#SingleInstance Force
#Persistent
SetBatchLines, -1

IniRead, lhk1, LLARS Config.ini, LLARS Hotkey, start
IniRead, lhk2, LLARS Config.ini, LLARS Hotkey, coord/pause
IniRead, lhk3, LLARS Config.ini, LLARS Hotkey, config/resume
IniRead, lhk4, LLARS Config.ini, LLARS Hotkey, exit

settimer, configcheck, 250

scriptname := regexreplace(A_scriptname,"\..*","")

Hotkey %lhk1%, Start
Hotkey %lhk2%, coordb
Hotkey %lhk3%, Configb
Hotkey %lhk4%, exitb

Gui +LastFound +OwnDialogs +AlwaysOnTop
Gui, Font, s11
Gui, font, bold
Gui, Add, Button, x15 y5 w190 h25 gStart , Start %scriptname%
Gui, Add, Button, x15 y35 w90 h25 gCoordb , Coordinates
Gui, Add, Button, x115 y35 w90 h25 gConfigb , Config File
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
Gui, Show,w220 h170, LLARS

IniRead, x, LLARS Config.ini, GUI POS, guix
IniRead, y, LLARS Config.ini, GUI POS, guiy
WinMove A, ,%X%, %y%

coordcount = 0
frcount = 0

OnMessage(0x0201, "WM_LBUTTONDOWN")
WM_LBUTTONDOWN() {
	If (A_Gui)
		PostMessage, 0xA1, 2
}
return

CoordB:
If (coordcount = 0)
{
	++coordcount
	CoordMode, Mouse, Screen
	MouseGetPos,X,Y
	settimer, tooltipcoord1, 25	
	return
}
else if (coordcount = 1)
{	
	++coordcount
	CoordMode, Mouse, Screen	
	MouseGetPos,X2,Y2
	IniWrite,----------`nxmin=%x%`nxmax=%x2%`nymin=%y%`nymax=%y2%,Coordinates.ini, Coordinates [%A_Hour%:%A_Min%:%A_Sec%] - %A_MM%/%A_DD%
	settimer, tooltipcoord1, OFF
	settimer, tooltipcoord2, 100
	clipboard =
(
xmin=%x%
xmax=%x2%
ymin=%y%
ymax=%y2%
)
	ClipWait
	clipboard := clipboard
	return
}
else if (coordcount = 2)
{
	settimer, tooltipcoord2, off
	ToolTip
	coordcount = 0
	return
}
Return

tooltipcoord1:
mousegetpos xn, yn
ToolTip,x=%X% y=%Y%, (xn+7), (yn+7),1
return

tooltipcoord2:
mousegetpos xn, yn
ToolTip, xmin=%x%`nxmax=%x2%`nymin=%y%`nymax=%y2%`n`nCoordinates are stored in clipboard and`n%A_ScriptDir%\Coordinates.ini`n`nPress F10 to clear this message, (xn+7), (yn+7),1
return

ConfigB:
Run %A_ScriptDir%\Config.ini
Return

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
}
return

ExitB:
guiclose:
exitapp

Start:
If (frcount = 0)
{
	IniRead, lhk1, LLARS Config.ini, LLARS Hotkey, start
	IniRead, lhk2, LLARS Config.ini, LLARS Hotkey, coord/pause
	IniRead, lhk3, LLARS Config.ini, LLARS Hotkey, config/resume
	IniRead, lhk4, LLARS Config.ini, LLARS Hotkey, exit
	
	Hotkey %lhk1%, Start
	Hotkey %lhk2%, pauseb
	Hotkey %lhk3%, resumeb
	Hotkey %lhk4%, exitb
	
	WinGetPos, X, Y,,, LLARS
	Gui destroy
	Gui +LastFound +OwnDialogs +AlwaysOnTop
	Gui, Font, s11
	Gui, font, bold
	Gui, Add, Button, x15 y5 w190 h25 gStart , Start %scriptname%
	Gui, Add, Button, x15 y35 w90 h25 gPauseb , Pause
	Gui, Add, Button, x115 y35 w90 h25 gResumeb , Resume
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
	Gui, Show,w220 h170, LLARS
	WinMove, LLARS,, X, Y,
	
	count = 0
	++frcount
}

else
	
sleep 250

InputBox, runcount, Run How Many Times?,,,250, 100

sleep 100

GuiControl,,ScriptBlue, %scriptname% 
GuiControl,,State3, Running

runcount3 = %runcount%
count2 = 0
firstrun = 0

loop % runcount
{ 	
	If firstrun = 0
	{
		winactivate, RuneScape	
		
		++count
		++count2
		
		SetFormat, Float, 03.0
		runcount3 += 0.0
		count2 += 0.0
		count += 0.0
		
		GuiControl,,Counter, %count%
		GuiControl,,Counter2, %count2% / %runcount3%
		GuiControl,,ScriptBlue, %scriptname%
		GuiControl,,State3, Running
		
		IniRead, sa1, Config.ini, Sleep Brief, min
		IniRead, sa2, Config.ini, Sleep Brief, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		CoordMode, Mouse, Screen
		IniRead, x1, Config.ini, Bank Prime Coords, xmin
		IniRead, x2, Config.ini, Bank Prime Coords, xmax
		IniRead, y1, Config.ini, Bank Prime Coords, ymin
		IniRead, y2, Config.ini, Bank Prime Coords, ymax
		Random, x, %x1%, %x2%
		Random, y, %y1%, %y2%
		Click, %x%, %y%
		
		IniRead, sa1, Config.ini, Sleep Short, min
		IniRead, sa2, Config.ini, Sleep Short, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		IniRead, hkbank, Config.ini, Bank Form Preset, hotkey
		send {%hkbank%}
		
		IniRead, sa1, Config.ini, Sleep Short, min
		IniRead, sa2, Config.ini, Sleep Short, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		CoordMode, Mouse, Screen
		IniRead, x1, Config.ini, Crafter Coords, xmin
		IniRead, x2, Config.ini, Crafter Coords, xmax
		IniRead, y1, Config.ini, Crafter Coords, ymin
		IniRead, y2, Config.ini, Crafter Coords, ymax
		Random, x, %x1%, %x2%
		Random, y, %y1%, %y2%
		Click, %x%, %y%
		
		IniRead, sa1, Config.ini, Sleep Walk, min
		IniRead, sa2, Config.ini, Sleep Walk, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		send {1}
		
		IniRead, sa1, Config.ini, Sleep Short, min
		IniRead, sa2, Config.ini, Sleep Short, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		CoordMode, Mouse, Screen
		IniRead, x1, Config.ini, Pottery Menu Coords, xmin
		IniRead, x2, Config.ini, Pottery Menu Coords, xmax
		IniRead, y1, Config.ini, Pottery Menu Coords, ymin
		IniRead, y2, Config.ini, Pottery Menu Coords, ymax
		Random, x, %x1%, %x2%
		Random, y, %y1%, %y2%
		Click, %x%, %y%
		
		IniRead, sa1, Config.ini, Sleep Short, min
		IniRead, sa2, Config.ini, Sleep Short, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		CoordMode, Mouse, Screen
		IniRead, x1, Config.ini, Pottery Sub-Menu Coords, xmin
		IniRead, x2, Config.ini, Pottery Sub-Menu Coords, xmax
		IniRead, y1, Config.ini, Pottery Sub-Menu Coords, ymin
		IniRead, y2, Config.ini, Pottery Sub-Menu Coords, ymax
		Random, x, %x1%, %x2%
		Random, y, %y1%, %y2%
		Click, %x%, %y%
		
		IniRead, sa1, Config.ini, Sleep Short, min
		IniRead, sa2, Config.ini, Sleep Short, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		CoordMode, Mouse, Screen
		IniRead, item, Config.ini, Item Config, item
		IniRead, x1, Config.ini, %item%, xmin
		IniRead, x2, Config.ini, %item%, xmax
		IniRead, y1, Config.ini, %item%, ymin
		IniRead, y2, Config.ini, %item%, ymax
		Random, x, %x1%, %x2%
		Random, y, %y1%, %y2%
		Click, %x%, %y%
	}
	If firstrun = 1
	{
		++count
		++count2
		
		SetFormat, Float, 03.0
		runcount3 += 0.0
		count2 += 0.0
		count += 0.0
		firstrun = 0
		
		winactivate, RuneScape	
		
		GuiControl,,Counter, %count%
		GuiControl,,Counter2, %count2% / %runcount3%
		GuiControl,,ScriptBlue, %scriptname%
		GuiControl,,State3, Running
		
		CoordMode, Mouse, Screen
		IniRead, x1, Config.ini, Bank Main Coords, xmin
		IniRead, x2, Config.ini, Bank Main Coords, xmax
		IniRead, y1, Config.ini, Bank Main Coords, ymin
		IniRead, y2, Config.ini, Bank Main Coords, ymax
		Random, x, %x1%, %x2%
		Random, y, %y1%, %y2%
		Click, %x%, %y%
		
		IniRead, sa1, Config.ini, Sleep Walk, min
		IniRead, sa2, Config.ini, Sleep Walk, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		IniRead, hkbank, Config.ini, Bank Form Preset, hotkey
		send {%hkbank%}
		
		IniRead, sa1, Config.ini, Sleep Short, min
		IniRead, sa2, Config.ini, Sleep Short, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		CoordMode, Mouse, Screen
		IniRead, x1, Config.ini, Crafter Coords, xmin
		IniRead, x2, Config.ini, Crafter Coords, xmax
		IniRead, y1, Config.ini, Crafter Coords, ymin
		IniRead, y2, Config.ini, Crafter Coords, ymax
		Random, x, %x1%, %x2%
		Random, y, %y1%, %y2%
		Click, %x%, %y%
		
		IniRead, sa1, Config.ini, Sleep Short, min
		IniRead, sa2, Config.ini, Sleep Short, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		send {1}
	}
	If firstrun = 0
	{
		++firstrun
		
		IniRead, sa1, Config.ini, Sleep Short, min
		IniRead, sa2, Config.ini, Sleep Short, max
		Random, SleepAmount, %sa1%, %sa2%
		Sleep, %SleepAmount%
		
		send {space}
		
		IniRead, sa1, Config.ini, Sleep Form, min
		IniRead, sa2, Config.ini, Sleep Form, max
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
	
	CoordMode, Mouse, Screen
	IniRead, x1, LLARS Config.ini, Logout, xmin
	IniRead, x2, LLARS Config.ini, Logout, xmax
	IniRead, y1, LLARS Config.ini, Logout, ymin
	IniRead, y2, LLARS Config.ini, Logout, ymax
	Random, x, %x1%, %x2%
	Random, y, %y1%, %y2%
	Click, %x%, %y%
	
	IniRead, sa1, Config.ini, Sleep Brief, min
	IniRead, sa2, Config.ini, Sleep Brief, max
	Random, SleepAmount, %sa1%, %sa2%
	Sleep, %SleepAmount%	
}

GuiControl,,ScriptGreen, %scriptname%
GuiControl,,State1, Finished

SoundPlay, C:\Windows\Media\Ring06.wav, 1
MsgBox , 48, LLARS Has Finished, LLARS has ran the %scriptname% script %runcount3% times.

return