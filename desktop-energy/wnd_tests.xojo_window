#tag DesktopWindow
Begin DesktopWindow wnd_tests
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   HasTitleBar     =   True
   Height          =   472
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   161908735
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Untitled"
   Type            =   0
   Visible         =   True
   Width           =   930
   Begin MeterCanvas Canvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   100
      Index           =   -2147483648
      Left            =   58
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   56
      Transparent     =   False
      Visible         =   True
      Width           =   287
   End
   Begin Timer TimerAnimate
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   100
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin DesktopSlider Slider1
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   30
      Index           =   -2147483648
      Left            =   58
      LineStep        =   1
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumValue    =   50
      MinimumValue    =   0
      PageStep        =   3
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   0
      Tooltip         =   ""
      Top             =   203
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   287
   End
   Begin DesktopTextField TextField1
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   58
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   275
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   129
   End
   Begin DesktopButton Button1
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Button"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   265
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   275
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin AnalogCanvas Canvas2
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   256
      Index           =   -2147483648
      Left            =   514
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      NeedlePaintColor=   &c00000000
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   56
      Transparent     =   True
      Visible         =   True
      Width           =   284
   End
   Begin DesktopSlider Slider2
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   30
      Index           =   -2147483648
      Left            =   514
      LineStep        =   1
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumValue    =   275
      MinimumValue    =   0
      PageStep        =   3
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   0
      Tooltip         =   ""
      Top             =   332
      Transparent     =   False
      Value           =   235
      Visible         =   True
      Width           =   287
   End
   Begin FlatAnalogCanvas Canvas3
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      CurrentValue    =   0.0
      DeltaForAnimate =   0.0
      Enabled         =   True
      Height          =   53
      Index           =   -2147483648
      Left            =   58
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MeterMajorStepValue=   0.0
      MeterMaxValue   =   0.0
      MeterMinorStepValue=   0.0
      MeterMinValue   =   0.0
      OrangeStartValue=   0.0
      RedStartValue   =   0.0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TargetValue     =   0.0
      TickLabelFormat =   ""
      Tooltip         =   ""
      Top             =   324
      Transparent     =   False
      Visible         =   True
      Width           =   346
   End
   Begin FlatAnalogCanvas Canvas4
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      CurrentValue    =   0.0
      DeltaForAnimate =   0.0
      Enabled         =   True
      Height          =   53
      Index           =   -2147483648
      Left            =   58
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MeterMajorStepValue=   0.0
      MeterMaxValue   =   0.0
      MeterMinorStepValue=   0.0
      MeterMinValue   =   0.0
      OrangeStartValue=   0.0
      RedStartValue   =   0.0
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TargetValue     =   0.0
      TickLabelFormat =   ""
      Tooltip         =   ""
      Top             =   399
      Transparent     =   False
      Visible         =   True
      Width           =   346
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		  var blackNumbers as new clNumberTemplate()
		  blackNumbers.PrepareTemplate
		  
		  var redNumbers as new clNumberTemplate()
		  redNumbers.DigitBackColor = &cCC0000
		  redNumbers.PrepareTemplate
		  
		  canvas1.Configure(blackNumbers, redNumbers, "0000.00")
		  
		  
		  TimerAnimate.period = 1000 / MeterCanvas.AnimateCallFrequency
		  TimerAnimate.RunMode = Timer.RunModes.Multiple
		  
		  Canvas1.UpdateNumber(124.5)
		  
		  
		  canvas2.SetMeterLabels("V","~")
		  canvas2.SetValueRange(200,275, 5, 25)
		  
		  canvas2.PrepareTemplate(app.config.AnalogMeterBackgroundColor, app.config.AnalogMeterTicksColor, app.config.AnalogMeterNeedleColor)
		  
		  
		  canvas3.SetMeterLabels("Wh","~")
		  var c as clMeterConfig
		  c.Minimum = 200
		  c.Maximum = 275
		  c.MinorTicks= 25
		  c.MajorTicks = 100
		  c.LabelFormat = "###0"
		  canvas3.Configure(c)
		  
		  
		  canvas4.SetMeterLabels("Wh","~")
		  canvas4.Configure(c)
		  canvas4.SetLimits(235,256)
		  
		  canvas2.SetValue(slider2.Value)
		  canvas3.SetValue(slider2.Value)
		  canvas4.SetValue(slider2.Value)
		  
		  
		  
		  Return
		End Sub
	#tag EndEvent


	#tag Note, Name = Norme IEC 60947-2
		
		Le niveau de tolérance défini par IEC60947-2 est de 0,85 % de minimum de tension nominale (Un) et 1,1% de maximum de tension
		nominale (Un).
		Exemple : pour Un = 230/240V, le niveau de tolérance minimum est (0,85 % de 230 V CA) = 195,5 V, le niveau de tolérance maximum est
		(1,1 % de 240 V CA) = 264 V.
		
		 l'onduleur doit déclencher instantanément à 264,5v (c'est énorme) et pour 253 v pendant dix minutes.
		
		
		
		extrait d'un document (interne) ORES :
		
		"Préconise le respect de la norme EN50160.
		La norme :
		Les mesures ont été réalisées suivant la norme européenne EN50160 nov. 1999 : Caractéristiques de la tension
		fournie par les réseaux publics de distribution. Les valeurs de la mesure sont basées sur des valeurs efficaces
		moyennées sur 10 min. Les résultats sont valables pour des conditions normales d’exploitation. Par définition, la
		période de mesure est égale à une semaine. Les résultats de la mesure doivent être conformes avec la norme
		pendant 95% du temps.
		
		La variation de tension : Les variations doivent, pendant 95% du temps de mesure, se
		situer dans la plage Un –10% et Un +6%.
		La valeur normalisée (Un) est de 230V.
		Toutes les variations de tension (pendant 100% du temps de mesure) doivent se situer entre –15%
		et +10% de Un."
		
	#tag EndNote

	#tag Note, Name = Reseau
		
		Pour le réseau, tous les transformateurs sont réversibles.
		Le problème vient des pertes par la résistance des fils électriques.
		Ainsi, le transformateur donne 245V à ses bornes BT de sortie. Le courant absorbé dans la rue est de l'odre de 250A. Le premier client à 50m du transformateur reçois 240V. Le client du milieu de la rue a 225V et celui du bout à 215V.
		Arrive les panneaux solaires qui donnent leur maximum vers midi. Les chutes de tension ne se font plus du transformateur vers les clients mais des clients PV vers le transformateur. Alors si la rue est bien équipée en PV, pour envoyer l'énergie vers le HT, les bornes BT du transformateur sont à 250V. Le client proche est à 255V et s'il a aussi du PV, le dernier client de la rue monte bien au-dessus des 260V. Du coup, son onduleur se met en sécurité...
		Le GRD intervient car tout le monde se plaint : le transformateur (pour peut qu'il soit réglable avec des plots) est ajusté à 230V. Mais en hiver et la nuit, la tension chez le dernier client tombe sous 200V.
		L'autre solution : un transformateur à plots avec ajustement automatique de la tension, pour rester dans la bonne fourchette de valeurs jour et nuit, été comme hiver. Le hic c'est que cela a un prix et que le GRD ne peut équiper toutes ses cabines de transformation de la sorte instantanément. Surtout que les producteurs PV ne rapportaient rien au GRD quand les compteurs pouvaient tourner à l'envers...
		
	#tag EndNote


#tag EndWindowCode

#tag Events TimerAnimate
	#tag Event
		Sub Action()
		  Canvas1.Animate
		  Canvas2.Animate
		  canvas3.Animate
		  Canvas4.Animate
		  
		  
		  if Canvas1.OnTarget and  canvas2.OnTarget and  canvas3.OnTarget and  canvas4.OnTarget then 
		    me.RunMode = timer.RunModes.Off
		    
		  end if
		  
		  return 
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  
		  
		  var tmp as integer = me.Value
		  
		  if tmp < 1 then 
		    TimerAnimate.period = 1000 / MeterCanvas.AnimateCallFrequency
		    
		  else
		    TimerAnimate.period = 1000 / tmp
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button1
	#tag Event
		Sub Pressed()
		  
		  var d as Double = TextField1.Text.Trim.ToDouble
		  
		  TimerAnimate.RunMode = timer.RunModes.Multiple
		  
		  canvas1.UpdateNumber(d)
		  
		  return
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider2
	#tag Event
		Sub ValueChanged()
		  
		  canvas2.SetValue(me.Value)
		  canvas3.SetValue(me.Value)
		  canvas4.SetValue(me.Value)
		  
		  TimerAnimate.RunMode = timer.RunModes.Multiple
		  
		  return 
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasTitleBar"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
