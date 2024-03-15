#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ProgressConstants.au3>
#include <GUIEdit.au3>
#Include <WinAPI.au3>
#include <Date.au3>

#Region (=== GUI generated by GuiBuilderPlus 1.2.0 ===)
Global $hGUI, $START, $hyperlink
Global $Tab_1, $TabItem_1, $IKEYFISH, $Label_1, $TabItem_2, $Label_2, $IZONELEFT, $Label_3, $IZONEBOTTOM
Global $IZONETOP, $IZONERIGHT, $Label_5, $Label_4, $Label_6, $ICOLORMOUSEMOVE, $ICOLORMOUSECLICK1, $Label_7
Global $Label_8, $ICOLORMOUSECLICK2, $Label_9, $ICOLORMOUSECLICK3, $Label_10, $ICOLORMOUSECLICK4, $Label_11
Global $ISHADEBOBBER, $Label_12, $ISHADECLICK, $CEDIT, $Label_13, $IKEYDEBUG, $Button_1, $Label_14, $Label_15
HotKeySet ( "{k}" , "myExit" )
HotKeySet ( "{F11}" , "myPause" )
HotKeySet ( "{F10}" , "Fish" )
;------------------------------------------------------
; Title...........:	_guiCreate
; Description.....:	Create the main GUI
;------------------------------------------------------
Func MYEXIT ( )
	Exit
EndFunc

Func MYPAUSE ( )
	_GUICTRLEDIT_APPENDTEXT ( $CEDIT , _NOW ( ) & " : " & "Pause" & @CRLF )
	_main()
EndFunc
Func FISH ( )
	Global $LEFT = GUICtrlRead ( $IZONELEFT )
	Global $TOP = GUICtrlRead ( $IZONETOP )
	Global $RIGHT = GUICtrlRead ( $IZONERIGHT )
	Global $BOTTOM = GUICtrlRead ( $IZONEBOTTOM )
	Global $COLOR1 = GUICtrlRead ( $ICOLORMOUSEMOVE )
	Global $SHADEBOBBERR = GUICtrlRead ( $ISHADEBOBBER )
	Global $COLOR = GUICtrlRead ( $ICOLORMOUSECLICK1 )
	Global $COLOR2 = GUICtrlRead ( $ICOLORMOUSECLICK2 )
	Global $COLOR3 = GUICtrlRead ( $ICOLORMOUSECLICK3 )
	Global $COLOR4 = GUICtrlRead ( $ICOLORMOUSECLICK4 )
	Global $SHADECLICKK = GUICtrlRead ( $ISHADECLICK )
	Global $SENDKEYFISH = GUICtrlRead ( $IKEYFISH )
	WinActivate ( "World of Warcraft" )
	_GUICTRLEDIT_APPENDTEXT ( $CEDIT , _NOW ( ) & " : " & "Start !" & @CRLF )
	If GUICtrlRead ( $IKEYDEBUG ) = 1 Then
		_GUICTRLEDIT_APPENDTEXT ( $CEDIT , _NOW ( ) & " : " & "DEBUG. $color1=" & $COLOR1 & @CRLF )
		_GUICTRLEDIT_APPENDTEXT ( $CEDIT , _NOW ( ) & " : " & "DEBUG. $shadebobberr=" & $SHADEBOBBERR & @CRLF )
		_GUICTRLEDIT_APPENDTEXT ( $CEDIT , _NOW ( ) & " : " & "DEBUG. $color2=" & $COLOR2 & @CRLF )
		_GUICTRLEDIT_APPENDTEXT ( $CEDIT , _NOW ( ) & " : " & "DEBUG. $shadeclickk=" & $SHADECLICKK & @CRLF )
	EndIf
	Global $MS = Random ( 25 , 55 )
	Sleep ( 2000 )
	While 1
		Global $STARTTIME = TimerInit ( )
		MouseMove ( 500 , 200 , $MS )
		Send ( $SENDKEYFISH )
		_GUICTRLEDIT_APPENDTEXT ( $CEDIT , _NOW ( ) & " : " & "Press the fishing button" & @CRLF )
		Sleep ( Random ( 2500 , 4500 , 1 ) )
		Global $PIX = PixelSearch ( $LEFT , $TOP , $RIGHT , $BOTTOM , $COLOR1 , $SHADEBOBBERR )
		If IsArray ( $PIX ) = True Then
			ConsoleWrite ( "Console detected Pix1" & @LF & "" )
			_GUICTRLEDIT_APPENDTEXT ( $CEDIT , _NOW ( ) & " : " & "Blobber found :-)" & @CRLF )
			;MouseMove ( $PIX [ 0 ] - Random ( 1 , 10 , 1 ) , $PIX [ 1 ] + Random ( 1 , 10 , 1 ) , $MS )
		Else
			_GUICTRLEDIT_APPENDTEXT ( $CEDIT , _NOW ( ) & " : " & "Blobber not found :-(" & @CRLF )
			$STARTTIME = 0
		EndIf
		Do
			;Global $POS = MouseGetPos ( )
			If IsArray ( $PIX ) = True Then
				Global $POS = $PIX
				Global $PIX2 = PixelSearch ( $POS [ 0 ] + 4294967256 , $POS [ 1 ] + 4294967273 , $POS [ 0 ] + 40 , $POS [ 1 ] + 23 , $COLOR & $COLOR2 & $COLOR3 & $COLOR4 , $SHADECLICKK )
				If Not ( @error ) Then
					_GUICTRLEDIT_APPENDTEXT ( $CEDIT , _NOW ( ) & " : " & "Blobber move, fish it ! :-)" & @CRLF )
					Sleep ( Random ( 700 , 1000 , 1 ) )
					MouseMove ( $POS [ 0 ] - Random ( 1 , 10 , 1 ) , $PIX [ 1 ] + Random ( 1 , 10 , 1 ) , $MS )
					MouseClick ( "right" )
					Sleep ( Random ( 700 , 1200 , 1 ) )
					If TimerDiff ( $STARTTIME ) < 30000 Then $STARTTIME = 0
					
				EndIf
			EndIf
		Until TimerDiff ( $STARTTIME ) > ( Random ( 28500 , 30000 , 1 ) )
	WEnd
EndFunc
Func _guiCreate()
	$hGUI = GUICreate("Simple Fishing Bot v0.1.16", 827, 600, 737, 288)
	$CEDIT = GUICtrlCreateEdit("", 445, 120, 366, 441)
	$START = GUICtrlCreateButton("Start (F10)", 330, 20, 171, 41)
	$Label_14 = GUICtrlCreateLabel("Press the K key to close the bot", 545, 25, 191, 16)
	$Label_15 = GUICtrlCreateLabel("Press the F11 key to pause the bot", 545, 44, 191, 16)	
	$hyperlink = GUICtrlCreateLabel("Source on Github", 715, 570, 120, 20)
	GUICtrlSetFont(-1, 10, 400, 4, "MS Sans Serif")
	GUICtrlSetColor(-1, 0x0000FF)
	GUICtrlSetCursor(-1, 0)
	$Tab_1 = GUICtrlCreateTab(25, 100, 401, 461)
	$TabItem_1 = GUICtrlCreateTabItem("Basic")
	$IKEYFISH = GUICtrlCreateInput("i", 125, 145, 96, 21, $ES_CENTER)
	$Label_1 = GUICtrlCreateLabel("Shortcut Fishing", 35, 140, 81, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	$Label_2 = GUICtrlCreateLabel("Top Left X", 35, 179, 81, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	$IZONELEFT = GUICtrlCreateInput("450", 123, 184, 96, 21, $ES_CENTER)
	$Label_3 = GUICtrlCreateLabel("Top Left Y", 35, 219, 81, 31, BitOR($SS_CENTERIMAGE, $SS_CENTER))
	$IZONEBOTTOM = GUICtrlCreateInput("628", 125, 304, 96, 21, $ES_CENTER)
	$IZONETOP = GUICtrlCreateInput("155", 125, 224, 96, 21, $ES_CENTER)
	$IZONERIGHT = GUICtrlCreateInput("1450", 125, 264, 96, 21, $ES_CENTER)
	$Label_5 = GUICtrlCreateLabel("Bottom Right X", 35, 259, 81, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	$Label_4 = GUICtrlCreateLabel("Bottom Right Y", 35, 299, 81, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	$Label_13 = GUICtrlCreateLabel("Debug", 35, 340, 81, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	$IKEYDEBUG = GUICtrlCreateCheckbox("Checkbox 1", 130, 345, 16, 20)

	$Label_16 = GUICtrlCreateLabel("WoW", 92, 391, 266, 146, $SS_CENTER)
	GUICtrlSetBkColor(-1, 0x06BEC8)
	$Label_17 = GUICtrlCreateLabel("Detection aera", 130, 415, 196, 101, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetFont(-1, 12)
	GUICtrlSetBkColor(-1, 0x4735EC)
	$Label_18 = GUICtrlCreateLabel("Top Left X and Y", 132, 417, 86, 11)
	GUICtrlSetFont(-1, 8,700)
	GUICtrlSetColor(-1, 0xF1071F)
	GUICtrlSetBkColor(-1, 0x4735EC)
	$Label_19 = GUICtrlCreateLabel("Bottom Right X and Y", 215, 500, 106, 11)
	GUICtrlSetFont(-1, 8,700)
	GUICtrlSetColor(-1, 0xF1071F)
	GUICtrlSetBkColor(-1, 0x4735EC)
	$TabItem_2 = GUICtrlCreateTabItem("Advanced")
	$Label_6 = GUICtrlCreateLabel("Float Color", 35, 140, 156, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	$ICOLORMOUSEMOVE = GUICtrlCreateInput("0x7b2919", 220, 145, 96, 21, $ES_CENTER)
	$ICOLORMOUSECLICK1 = GUICtrlCreateInput("16777215", 220, 184, 96, 21, $ES_CENTER)
	$Label_7 = GUICtrlCreateLabel("Moving Float Color", 35, 179, 156, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	$Label_8 = GUICtrlCreateLabel("Moving Float Color 2", 35, 214, 156, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	$ICOLORMOUSECLICK2 = GUICtrlCreateInput("7238010", 220, 219, 96, 21, $ES_CENTER)
	$Label_9 = GUICtrlCreateLabel("Moving Float Color 3", 35, 249, 156, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	$ICOLORMOUSECLICK3 = GUICtrlCreateInput("13096888", 220, 254, 96, 21, $ES_CENTER)
	$Label_10 = GUICtrlCreateLabel("Moving Float Color 4", 36, 284, 156, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	$ICOLORMOUSECLICK4 = GUICtrlCreateInput("13484473", 220, 289, 96, 21, $ES_CENTER)
	$Label_11 = GUICtrlCreateLabel("Float Color Variation", 35, 319, 156, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	$ISHADEBOBBER = GUICtrlCreateInput("15", 220, 324, 96, 21, $ES_CENTER)
	$Label_12 = GUICtrlCreateLabel("Moving Float Color Variation", 41, 351, 156, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	$ISHADECLICK = GUICtrlCreateInput("5", 220, 359, 96, 21, $ES_CENTER)

	


EndFunc   ;==>_guiCreate
#EndRegion (=== GUI generated by GuiBuilderPlus 1.2.0 ===)

_guiCreate()
_main()

;------------------------------------------------------
; Title...........:	_main
; Description.....:	run the main program loop
;------------------------------------------------------
Func _main()
	
	GUISetState(@SW_SHOWNORMAL)

	While 1
		$MSG = GUIGetMsg ( )
		Select
		Case $MSG = $START
			FISH ( )
		Case $MSG = $GUI_EVENT_CLOSE
			Exit
		Case $MSG = $hyperlink
            ShellExecute("https://github.com/GeoHolz?tab=repositories")
		EndSelect
	WEnd
EndFunc   ;==>_main

