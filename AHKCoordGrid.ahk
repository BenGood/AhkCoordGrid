#SingleInstance
DetectHiddenWindows, On
VerticalScale := 1
numberOfRows := 5
numberOfCols := 5


KeyArray := {a:{row:1,col:1}, b:{row:1,col:2}, c:{row:1,col:3},d:{row:1,col:4},e:{row:1,col:5},f:{row:2,col:1},g:{row:2,col:2},h:{row:2,col:3},i:{row:2,col:4},j:{row:2,col:5},k:{row:3,col:1},l:{row:3,col:2},m:{row:3,col:3},n:{row:3,col:4},o:{row:3,col:5},p:{row:4,col:1},q:{row:4,col:2},r:{row:4,col:3},s:{row:4,col:4},t:{row:4,col:5},u:{row:5,col:1},v:{row:5,col:2},w:{row:5,col:3},x:{row:5,col:4},y:{row:5,col:5}}

#IfWinNotActive CoordGrid
	#IfWinNotExist CoordGrid

		CapsLock::
			SetCapsLockState, Off
			GridHeight := VerticalScale * A_ScreenHeight
			GridWidth := A_ScreenWidth
			Xoff := 0
			Yoff := 0
			DisplayGrid()

	#IfWinNotExist	
#IfWinNotActive	

#IfWinExist CoordGrid
	#IfWinNotActive CoordGrid
		CapsLock::
			SetCapsLockState, Off
			winmove , CoordGrid,,0,0
			Gui Show
			Return
	#IfWinNotActive	
#IfWinExist

#IfWinActive CoordGrid
	CapsLock::
		SetCapsLockState, Off
		Gui Destroy
		Return
		
	[:: 
		send, {Wheelup 1}
		Return

	':: send, {Wheeldown 1}
		Return

	~a:: gosub, RunKey
	~b:: gosub, RunKey
	~c:: gosub, RunKey
	~d:: gosub, RunKey
	~e:: gosub, RunKey
	~f:: gosub, RunKey
	~g:: gosub, RunKey
	~h:: gosub, RunKey
	~i:: gosub, RunKey
	~j:: gosub, RunKey
	~k:: gosub, RunKey
	~l:: gosub, RunKey
	~m:: gosub, RunKey
	~n:: gosub, RunKey
	~o:: gosub, RunKey
	~p:: gosub, RunKey
	~q:: gosub, RunKey
	~r:: gosub, RunKey
	~s:: gosub, RunKey
	~t:: gosub, RunKey
	~u:: gosub, RunKey
	~v:: gosub, RunKey
	~w:: gosub, RunKey
	~x:: gosub, RunKey
	~y:: gosub, RunKey
	~z:: gosub, RunKey

	Space::
		Gui Destroy
		Click
		Return

	Enter::
		Gui Destroy
		Click Right
		Return

	Runkey:
		NavigateToCoord()
		Return

	DisplayGrid()
	{
		global VerticalScale, numberOfRows, numberOfCols, GridHeight, GridWidth, Xoff, Yoff, rowSpacing, colSpacing, KeyArray

		
		; Display Coordinates 
		rowSpacing := GridHeight / numberOfRows	
		colSpacing :=  GridWidth / numberOfCols

		For key, value in KeyArray {
			rowYCoord := Yoff + ( value.row -0.5) * rowSpacing ;
			colXCoord := Xoff +( value.col -0.5) * colSpacing 
			;ListVars
			;Pause
			Gui, Add, Progress, w10 h11 x%colXCoord% y%rowYCoord% BackgroundFFFFFF disabled
			StringUpper, keyalpha, key
			gui, add, text, w10 h11 x%colXCoord% y%rowYCoord% readonly backgroundtrans cRed, %keyalpha%
			
		}    
		
		Gui, Color, 000115
		Gui, Show, W%A_ScreenWidth% H%A_ScreenHeight%, CoordGrid
		Gui -Caption +AlwaysOnTop
		Gui, maximize
		WinSet, Transcolor, 000115, CoordGrid
		
		Return
	}

	NavigateToCoord()
	{
		Gui, Destroy
		CoordMode, Mouse, Screen
		global VerticalScale, numberOfRows, numberOfCols, GridHeight, GridWidth, Xoff, Yoff, rowSpacing, colSpacing, KeyArray

		pressedKey := SubStr(A_ThisHotkey,2,1)


		YCoord := Yoff + ( KeyArray[pressedKey].row -.5) * rowSpacing ;
		XCoord := Xoff + ( KeyArray[pressedKey].col - .5) * colSpacing ;


		MouseMove, %XCoord%, %YCoord% 

		Yoff := Yoff + ( KeyArray[pressedKey].row -1) * rowSpacing 
		Xoff := Xoff + ( KeyArray[pressedKey].col -1) * colSpacing
		
		GridHeight := GridHeight/numberOfRows
		GridWidth := GridWidth/numberOfCols
		DisplayGrid()
		
		Return
	}


#IfWinActive