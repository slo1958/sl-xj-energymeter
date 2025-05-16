#tag DesktopWindow
Begin DesktopWindow wnd_app
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
   Height          =   600
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Electricty Meter"
   Type            =   0
   Visible         =   True
   Width           =   800
   Begin Timer UpdateTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   1000
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin MeterCanvas MeterCanvas0
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   35
      Index           =   -2147483648
      Left            =   130
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
      Top             =   39
      Transparent     =   False
      Visible         =   True
      Width           =   156
   End
   Begin MeterCanvas MeterCanvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   35
      Index           =   -2147483648
      Left            =   130
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   78
      Transparent     =   False
      Visible         =   True
      Width           =   156
   End
   Begin MeterCanvas MeterCanvas2
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   35
      Index           =   -2147483648
      Left            =   350
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   39
      Transparent     =   False
      Visible         =   True
      Width           =   156
   End
   Begin MeterCanvas MeterCanvas3
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   35
      Index           =   -2147483648
      Left            =   350
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   78
      Transparent     =   False
      Visible         =   True
      Width           =   156
   End
   Begin DesktopLabel lbl_message
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   175
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "-"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   560
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   534
   End
   Begin Timer AnimateTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   1000
      RunMode         =   2
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin FlatAnalogCanvas FlatAnalogCanvas0
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      CurrentValue    =   0.0
      DeltaForAnimate =   0.0
      Enabled         =   True
      Height          =   55
      Index           =   -2147483648
      Left            =   130
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
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TargetValue     =   0.0
      TickLabelFormat =   ""
      Tooltip         =   ""
      Top             =   206
      Transparent     =   False
      Visible         =   True
      Width           =   200
   End
   Begin FlatAnalogCanvas FlatAnalogCanvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      CurrentValue    =   0.0
      DeltaForAnimate =   0.0
      Enabled         =   True
      Height          =   55
      Index           =   -2147483648
      Left            =   350
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
      Top             =   206
      Transparent     =   False
      Visible         =   True
      Width           =   200
   End
   Begin FlatAnalogCanvas FlatAnalogCanvas2
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      CurrentValue    =   0.0
      DeltaForAnimate =   0.0
      Enabled         =   True
      Height          =   55
      Index           =   -2147483648
      Left            =   570
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
      Top             =   206
      Transparent     =   False
      Visible         =   True
      Width           =   200
   End
   Begin DesktopLabel Label1
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   293
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "kWh"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   44
   End
   Begin DesktopLabel Label2
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   511
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "kWh"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   44
   End
   Begin DesktopLabel Label3
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   130
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "From network"
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   7
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   156
   End
   Begin DesktopLabel Label4
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   350
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "To network"
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   7
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   156
   End
   Begin DesktopLabel Label7
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "From network"
      TextAlignment   =   1
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   218
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   115
   End
   Begin DesktopLabel Label8
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   130
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "L1"
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   174
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin DesktopLabel Label9
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   350
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "L2"
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   174
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin DesktopLabel Label10
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   570
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "L3"
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   174
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin AnalogCanvas AnalogCanvas0
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   200
      Index           =   -2147483648
      Left            =   130
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      NeedlePaintColor=   &c00000000
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   348
      Transparent     =   False
      Visible         =   True
      Width           =   200
   End
   Begin AnalogCanvas AnalogCanvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   200
      Index           =   -2147483648
      Left            =   350
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      NeedlePaintColor=   &c00000000
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   348
      Transparent     =   False
      Visible         =   True
      Width           =   200
   End
   Begin AnalogCanvas AnalogCanvas2
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   200
      Index           =   -2147483648
      Left            =   570
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      NeedlePaintColor=   &c00000000
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   348
      Transparent     =   False
      Visible         =   True
      Width           =   200
   End
   Begin MeterCanvas MeterCanvas4
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   35
      Index           =   -2147483648
      Left            =   130
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   117
      Transparent     =   False
      Visible         =   True
      Width           =   156
   End
   Begin MeterCanvas MeterCanvas5
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   35
      Index           =   -2147483648
      Left            =   350
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   117
      Transparent     =   False
      Visible         =   True
      Width           =   156
   End
   Begin DesktopLabel Label11
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Total"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   125
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   115
   End
   Begin FlatAnalogCanvas FlatAnalogCanvas3
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      CurrentValue    =   0.0
      DeltaForAnimate =   0.0
      Enabled         =   True
      Height          =   55
      Index           =   -2147483648
      Left            =   130
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
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      TargetValue     =   0.0
      TickLabelFormat =   ""
      Tooltip         =   ""
      Top             =   273
      Transparent     =   False
      Visible         =   True
      Width           =   200
   End
   Begin FlatAnalogCanvas FlatAnalogCanvas4
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      CurrentValue    =   0.0
      DeltaForAnimate =   0.0
      Enabled         =   True
      Height          =   55
      Index           =   -2147483648
      Left            =   350
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
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      TargetValue     =   0.0
      TickLabelFormat =   ""
      Tooltip         =   ""
      Top             =   273
      Transparent     =   False
      Visible         =   True
      Width           =   200
   End
   Begin FlatAnalogCanvas FlatAnalogCanvas5
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      CurrentValue    =   0.0
      DeltaForAnimate =   0.0
      Enabled         =   True
      Height          =   55
      Index           =   -2147483648
      Left            =   570
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
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      TargetValue     =   0.0
      TickLabelFormat =   ""
      Tooltip         =   ""
      Top             =   273
      Transparent     =   False
      Visible         =   True
      Width           =   200
   End
   Begin DesktopLabel Label12
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "To network"
      TextAlignment   =   1
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   290
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   115
   End
   Begin Timer ResumePollingTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   1000
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin ControlLed CanvasLedTarif1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   17
      Index           =   -2147483648
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   47
      Transparent     =   False
      Visible         =   True
      Width           =   17
   End
   Begin ControlLed CanvasLedTarif2
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   17
      Index           =   -2147483648
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   86
      Transparent     =   False
      Visible         =   True
      Width           =   17
   End
   Begin DesktopLabel Label6
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   39
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Tarif 2"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   86
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   84
   End
   Begin DesktopLabel Label5
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   39
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Tarif 1"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   84
   End
   Begin ControlLed CanvasLedCommStatus
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   17
      Index           =   -2147483648
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   560
      Transparent     =   False
      Visible         =   True
      Width           =   17
   End
   Begin DesktopLabel Label13
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   49
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   33
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Comm status"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   560
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   114
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
		  
		  for each c as MeterCanvas in array(MeterCanvas0, MeterCanvas1, MeterCanvas2, MeterCanvas3, MeterCanvas4, MeterCanvas5)
		    c.Configure(blackNumbers, redNumbers, "00000.00")
		    
		  next
		  
		  
		  for each c as FlatAnalogCanvas in array (FlatAnalogCanvas0, FlatAnalogCanvas1, FlatAnalogCanvas2)
		    if app.config.powerMeterFromNetwork.Scale = 1000 then
		      c.SetMeterLabels("kW","~")
		      
		    else
		      c.SetMeterLabels("W","~")
		      
		    end if
		    
		    c.Configure(app.config.powerMeterFromNetwork)
		    
		  next
		  
		  
		  for each c as FlatAnalogCanvas in array (FlatAnalogCanvas3, FlatAnalogCanvas4, FlatAnalogCanvas5)
		    if app.config.powerMeterToNetwork.Scale = 1000 then
		      c.SetMeterLabels("kW","~")
		      
		    else
		      c.SetMeterLabels("W","~")
		      
		    end if
		    
		    c.Configure(app.config.powerMeterToNetwork)
		    
		  next
		  
		  CanvasLedTarif1.UsePicture(RoundLedGrey35, RoundLedGreen35)
		  CanvasLedTarif2.UsePicture(RoundLedGrey35, RoundLedGreen35)
		  
		  CanvasLedTarif1.LightOff
		  CanvasLedTarif2.LightOff
		  
		  CanvasLedCommStatus.UsePictures(RoundLedGrey35, RoundLedGreen35, RoundLedYellow35 ,RoundLedRed35)
		  var j as integer = 1
		  for each c as AnalogCanvas in array(AnalogCanvas0, AnalogCanvas1, AnalogCanvas2)
		    
		    c.SetMeterLabels("V","~")
		    c.Configure(app.config.voltageMeters)
		    //c.SetValueRange(200,275, 5, 25)
		    //c.AddOrangeRange(235, 256)
		    //c.AddRedRange(256, 275)
		    
		    c.PrepareTemplate(app.config.AnalogMeterBackgroundColor, app.config.AnalogMeterTicksColor, app.config.AnalogMeterNeedleColor)
		    
		    j=j+1
		  next
		  
		  ResumePollingTimer.RunMode = timer.RunModes.Off
		  
		  UpdateTimer.period = app.config.GetUpdatePeriodSeconds * 1000
		  UpdateTimer.RunMode = Timer.RunModes.Multiple
		  
		  AnimateTimer.period = 1000 / MeterCanvas.AnimateCallFrequency
		  AnimateTimer.RunMode = Timer.RunModes.Multiple
		  
		  RequestDatagram()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub DatagramReceived(DatagramSource as clDatagramProvider, Datagram as string)
		  
		  var c as new clMeterTelegram(Datagram)
		  
		  self.lastTelegram = c
		  self.lastError = "" 
		  
		  CanvasLedCommStatus.SetLight(1)
		  
		  UpdateUserInterface
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ErrorReceived(DatagramSource as clDatagramProvider, e as RuntimeException)
		  
		  app.WriteMessageToLog(e.Message)
		  
		  self.lastError =  e.Message
		  
		  System.DebugLog(e.Message)
		  
		  CanvasLedCommStatus.SetLight(3)
		  
		  UpdateUserInterface
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestDatagram()
		  
		  if DatagramSource = nil then
		    
		    select case  app.config.GetConnectionMode 
		      
		    case "HTTP"
		      DatagramSource = new clHTTPDatagramProvider(app.config.GetMeterURL(), app.config.GetTimeOutDelay)
		      
		    case "TCP"
		      DatagramSource = new clTCPDatgramProvider(app.config.GetMeterIPAddress, app.config.GetMeterPortNumber,  app.config.GetTimeOutDelay)
		      
		    end select
		    
		    if DatagramSource = nil then 
		      System.DebugLog("Cannot create connection")
		      
		      return 
		      
		    end if
		    
		    AddHandler DatagramSource.DatagramReceived, addressof DatagramReceived
		    AddHandler DatagramSource.ErrorReceived, addressof ErrorReceived
		    
		  end if
		  
		  
		  if self.RequestStatus <> clDatagramProvider.StatusIdle then Return
		  
		  self.lbl_message.text = DatagramSource.LastMessage
		  DatagramSource.RequestDatagram()
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RequestStatus() As integer
		  
		  if self.DatagramSource = nil then return clDatagramProvider.StatusGenericError
		  
		  return self.DatagramSource.RequestStatus
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetRefreshProcess()
		  
		  
		  if DatagramSource <> nil then DatagramSource.Reset
		  
		  UpdateTimer.period = app.config.GetUpdatePeriodSeconds * 1000
		  UpdateTimer.RunMode = Timer.RunModes.Multiple
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateRefreshProcess()
		  if self.RequestStatus < 0 then
		    UpdateTimer.RunMode = Timer.RunModes.Off
		    self.lbl_message.text = self.lastError
		    
		    IssueCount = IssueCount + 1
		    
		    ResumePollingTimer.Period = (app.config.GetResumePollingDelaySeconds - app.config.GetResumePollingDelayMinimum + 1 ) *1000
		    
		    ResumePollingCountDown = app.config.GetResumePollingDelayMinimum -1
		    
		    ResumePollingTimer.RunMode = timer.RunModes.Single
		    
		    Return
		    
		  end if
		  
		  
		  if RequestStatus <> 0 then
		    UpdateTimer.RunMode = Timer.RunModes.Single
		    UpdateTimer.Period = 1000 
		    IssueCount = IssueCount + 1
		    Return
		    
		  end if
		  
		  UpdateTimer.Period = app.config.GetUpdatePeriodSeconds * 1000
		  UpdateTimer.RunMode = Timer.RunModes.Multiple
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateUserInterface()
		  
		  self.lbl_message.text = self.lastError
		  if self.lastTelegram = nil then Return
		  
		  self.lbl_message.Text = "Datagram received."
		  
		  var tempScale as double
		  // Basic metering: power taken from the network
		  MeterCanvas0.UpdateNumber(self.lastTelegram.GetCounterValue("1.8.1"))
		  MeterCanvas1.UpdateNumber(self.lastTelegram.GetCounterValue("1.8.2"))
		  
		  // Basic metering: power sent to the network
		  MeterCanvas2.UpdateNumber(self.lastTelegram.GetCounterValue("2.8.1"))
		  MeterCanvas3.UpdateNumber(self.lastTelegram.GetCounterValue("2.8.2"))
		  
		  MeterCanvas4.UpdateNumber(self.lastTelegram.GetCounterValue("1.8.1") + self.lastTelegram.GetCounterValue("1.8.2")) 
		  MeterCanvas5.UpdateNumber(self.lastTelegram.GetCounterValue("2.8.1") + self.lastTelegram.GetCounterValue("2.8.2"))
		  
		  // kWh taken from network
		  tempScale = 1000 / app.config.powerMeterFromNetwork.Scale
		  FlatAnalogCanvas0.SetValue(self.lastTelegram.GetCounterValue("21.7.0")*tempScale)
		  FlatAnalogCanvas1.SetValue(self.lastTelegram.GetCounterValue("41.7.0")*tempScale)
		  FlatAnalogCanvas2.SetValue(self.lastTelegram.GetCounterValue("61.7.0")*tempScale)
		  
		  // kWh returned to network
		  tempScale = 1000 / app.config.powerMeterToNetwork.Scale
		  FlatAnalogCanvas3.SetValue(self.lastTelegram.GetCounterValue("22.7.0")*tempScale)
		  FlatAnalogCanvas4.SetValue(self.lastTelegram.GetCounterValue("42.7.0")*tempScale)
		  FlatAnalogCanvas5.SetValue(self.lastTelegram.GetCounterValue("62.7.0")*tempScale)
		  
		  // Voltage per phase
		  AnalogCanvas0.SetValue(self.lastTelegram.GetCounterValue("32.7.0"))
		  AnalogCanvas1.SetValue(self.lastTelegram.GetCounterValue("52.7.0"))
		  AnalogCanvas2.SetValue(self.lastTelegram.GetCounterValue("72.7.0"))
		  
		  var tmpTarif as integer = self.lastTelegram.GetCounterRawValue("96.14.0").ToInteger
		  
		  CanvasLedTarif1.SetLight(tmpTarif=1)
		  CanvasLedTarif2.SetLight(tmpTarif=2)
		  
		  //lbl_message.text = self.lastTelegram.GetCounterRawValue("96.14.0")
		  
		  Return
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected DatagramSource As clDatagramProvider
	#tag EndProperty

	#tag Property, Flags = &h0
		IssueCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		lastError As String
	#tag EndProperty

	#tag Property, Flags = &h0
		lastTelegram As clMeterTelegram
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ResumePollingCountDown As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events UpdateTimer
	#tag Event
		Sub Action()
		  
		  UpdateRefreshProcess
		  
		  RequestDatagram
		  
		  Return
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbl_message
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  
		  if self.RequestStatus < 0 then 
		    ResetRefreshProcess
		    me.text ="Restart..."
		    
		  end if
		  
		  return true
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events AnimateTimer
	#tag Event
		Sub Action()
		  
		  
		  for each ctrl as DesktopControl in self.Controls
		    if ctrl isa itfAnimate then
		      var c as itfAnimate = itfAnimate(ctrl)
		      
		      c.animate
		      
		    end if
		    
		  next
		  
		  return
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResumePollingTimer
	#tag Event
		Sub Action()
		  
		  if self.ResumePollingCountDown > 1 then
		    
		    CanvasLedCommStatus.SetLight(2)
		    
		    self.ResumePollingCountDown = self.ResumePollingCountDown - 1
		    self.ResumePollingTimer.Period = 1000
		    ResumePollingTimer.RunMode = timer.RunModes.Single
		    
		    lbl_message.Text = "Resume polling in " + str(self.ResumePollingCountDown) + " secs."
		    Return
		    
		  else
		    CanvasLedCommStatus.SetLight(1)
		    ResumePollingTimer.RunMode = timer.RunModes.off
		    lbl_message.Text = "Polling process restarted."
		    
		    ResetRefreshProcess
		    
		  end if
		  
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
	#tag ViewProperty
		Name="lastError"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="IssueCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
