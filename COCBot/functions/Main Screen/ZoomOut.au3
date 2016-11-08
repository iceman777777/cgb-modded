; #FUNCTION# ====================================================================================================================
; Name ..........: ZoomOut
; Description ...: Tries to zoom out of the screen until the borders, located at the top of the game (usually black), is located.
; Syntax ........: ZoomOut()
; Parameters ....:
; Return values .: None
; Author ........: Code Gorilla #94
; Modified ......: KnowJack (July 2015) stop endless loop
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
;Tries to zoom out of the screen until the borders, located at the top of the game (usually black), is located.
;Only does it for 20 zoom outs, no more than that.

Func ZoomOut() ;Zooms out
   Local $i = 0 ; Reset zoom out counter
   _CaptureRegion(0, 0, 860, 2) ; Capture the top rows of BlueStacks
   If _GetPixelColor(1, 1) <> Hex(0x000000, 6) And _GetPixelColor(850, 1) <> Hex(0x000000, 6) Then ; If the corners aren't black, then COC is not fully zoomed out
	  SetLog("Zooming Out", $COLOR_BLUE)
	  While _GetPixelColor(1, 1) <> Hex(0x000000, 6) And _GetPixelColor(850, 1) <> Hex(0x000000, 6) And $i <= 20 ; Zoom out loop that runs up to 20 times if BlueStacks is not fully zoomed out
		 If _Sleep(600) Then Return ; 600 ms delay between zooming attempts
		 WinActivate($HWnD) ; Set window focus to BlueStacks
		 Send("{DOWN}") ; Press the down button to zoom out
		 $i += 1  ; Increment the zoom out counter
		 _CaptureRegion(0, 0, 860, 2) ; Capture the top rows of Bluestacks
	  WEnd
	  If _GetPixelColor(1, 1) <> Hex(0x000000, 6) And _GetPixelColor(850, 1) <> Hex(0x000000, 6) Then ; If BlueStacks is not fully zoomed out after attempting to do so, make a note in the log
		 SetLog("Zooming Out Failed", $COLOR_RED)
	  Else ; If BlueStacks zoomed out successfully after attempting to do so, make a note in the log
		 SetLog("Zooming Completed Successfully", $COLOR_BLUE)
	  EndIf
   EndIf
EndFunc   ;==>

