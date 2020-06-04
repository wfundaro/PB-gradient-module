XIncludeFile "module_gadget_gradient.pbi"
Enumeration FormWindow
  #Window_0
EndEnumeration

Enumeration 5
  #gradient
  #button_info
EndEnumeration

Procedure OpenWindow_0(x = 0, y = 0, width = 500, height = 200)
  OpenWindow(#Window_0, x, y, width, height, "", #PB_Window_SystemMenu | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget | #PB_Window_SizeGadget | #PB_Window_ScreenCentered)
  ButtonGadget(#button_info, 20 , 150, 120, 30, "Info")
EndProcedure
OpenWindow_0()

gradient::new(#Window_0,#gradient,10,10,400,100)

gradient::add_cursor(#gradient,0.3,$FF2A82CF,0)
gradient::add_cursor(#gradient,0.734,$FCD1814A)
Repeat
  event = WaitWindowEvent()
  Select event
    Case #PB_Event_CloseWindow
      End
    Case #PB_Event_Gadget
      If EventGadget() = #button_info
        gradient::FirstElement_cursor(#gradient)
        For i=0 To gradient::get_number_cursor(#gradient)-1
          actif$ = "active"
          If gradient::get_cursor_state() = 0
            actif$ = "inactive"
          EndIf
          info_txt$ = info_txt$ + "cursor "+Str(i) + " in position : " + StrF(gradient::get_cursor_position()) +
                      " of color : " + Str(gradient::get_cursor_color()) + " is " + actif$ + Chr(13)
          gradient::next_cursor()
        Next
        CompilerIf #PB_Compiler_Debugger
          Debug info_txt$
        CompilerElse
          MessageRequester("Info text", info_txt$)
        CompilerEndIf
      EndIf
  EndSelect 
ForEver
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 25
; FirstLine = 6
; Folding = -
; EnableXP
; Executable = test.exe