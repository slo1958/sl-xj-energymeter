#tag Class
Protected Class AnalogCanvas
Inherits DesktopCanvas
Implements itfAnimate
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  
		  const wp as double = 160 // 200
		  
		  g.DrawPicture(MeterBackImage, 0,0)
		  
		  var v as double = CurrentValue
		  
		  if v < MeterMinValue then v = MeterMinValue
		  if v > MeterMaxValue then v = MeterMaxValue
		  
		  var ang as double =  3.1415926 / 2.0  * (v - MeterMinValue) / (MeterMaxValue-MeterMinValue)
		  
		  
		  var sx as double
		  var sy as double
		  
		  var dx as double
		  var dy as double
		  
		  var shadeDelta as double = 3
		  
		  sx = (wp+0) * cos(ang)
		  sy = wp - (wp+0) * sin(ang)
		  
		  dx = (1+shadeDelta)  * cos(ang)
		  dy = wp -  (1+shadeDelta) * sin(ang)
		  
		  g.PenSize = 3
		  g.DrawingColor = &cCCCCCCBB
		  
		  g.DrawLine(MeterXOffset+shadeDelta + sx,MeterYOffset + sy, MeterXOffset+shadeDelta + dx,MeterYOffset + dy)
		  
		  sx = wp * cos(ang)
		  sy = wp - wp * sin(ang)
		  
		  dx = 1  * cos(ang)
		  dy = wp - 1 * sin(ang)
		  
		  g.PenSize = 3
		  g.DrawingColor = self.NeedlePaintColor
		  
		  g.DrawLine(MeterXOffset + sx,MeterYOffset + sy, MeterXOffset + dx,MeterYOffset + dy)
		  
		  
		  g.DrawingColor = CommonPaintColor
		  
		  var r as double = MeterXOffset  
		  g.FillOval(MeterXOffset / 2, MeterYOffset +  wp - MeterXOffset/2, r,r)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddOrangeRange(minValue as double, maxValue as double)
		  
		  self.OrangeRanges.Add(minValue:maxValue)
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRedRange(minValue as double, maxValue as double)
		  
		  self.RedRanges.Add(minValue:maxValue)
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Animate()
		  
		  if self.OnTarget then Return
		  
		  self.CurrentValue = self.CurrentValue + DeltaForAnimate
		  
		  self.Refresh(false)
		  
		  return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Configure(params as clMeterConfig)
		  
		  self.MeterMinValue = params.Minimum
		  self.MeterMaxValue = params.Maximum
		  
		  self.MeterMajorStepValue = params.MajorTicks
		  self.MeterMinorStepValue = params.MinorTicks
		  
		  self.TickLabelFormat = params.LabelFormat
		  
		  if params.OrangeRangeStart <> 0 or params.OrangeRangeEnd <> 0 then
		    self.AddOrangeRange( params.OrangeRangeStart,params.OrangeRangeEnd)
		    
		  end if
		  
		  if params.RedRangeStart <>0 or params.RedRangeEnd <> 0 then
		    self.AddRedRange(params.RedRangeStart,params.RedRangeEnd)
		    
		  end if
		  
		  return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OnTarget() As Boolean
		  return abs(self.TargetValue - self.CurrentValue) < 0.01
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrepareTemplate(BackgroundColor as color, TicksColor as color, NeedleColor as color)
		  
		  const wp as double = 160 // 200
		  
		  self.Transparent = True
		  
		  self.BackgroundPaintColor = BackgroundColor
		  self.CommonPaintColor = TicksColor
		  self.NeedlePaintColor = NeedleColor
		  
		  MeterBackImage = new Picture(200,200)  
		  
		  var g as Graphics = MeterBackImage.Graphics
		  
		  var h as double = g.Height
		  var w as double = g.Width
		  
		  
		  g.DrawingColor = BackgroundPaintColor
		  g.FillRoundRectangle(0,0, w, h, 15,15) 
		  
		  g.DrawingColor = &c030303
		  g.DrawRoundRectangle(0,0, w, h, 15,15) 
		  
		  
		  MeterXOffset = (w - wp) / 2 
		  
		  MeterYOffset = 10
		  
		  
		  for v as double = 0 to (MeterMaxValue - MeterMinValue) step 0.05
		    var dv as Double = v + MeterMinValue
		    var ang as double 
		    
		    
		    if valueInRange(dv, OrangeRanges) then
		      ang =  3.1415926 / 2.0  * v  /  (MeterMaxValue - MeterMinValue)
		      g.DrawingColor = color.Orange
		      
		    elseif valueInRange(dv, RedRanges) then
		      ang =  3.1415926 / 2.0  * v /  (MeterMaxValue - MeterMinValue)
		      g.DrawingColor = &cFF0000
		      
		    else
		      ang = -1
		      
		    end if 
		    
		    if ang > 0 then 
		      var sx as double = wp * cos(ang)
		      var sy as double = wp - wp * sin(ang)
		      var dx as double = (wp-10)  * cos(ang)
		      var dy as double = wp - (wp-10) * sin(ang)
		      
		      g.PenSize = 1
		      g.DrawLine(MeterXOffset + sx,MeterYOffset + sy, MeterXOffset + dx, MeterYOffset + dy)
		      
		    end if
		    
		  next
		  
		  g.DrawingColor = CommonPaintColor
		  for v as double = 0 to (MeterMaxValue-MeterMinValue) step self.MeterMinorStepValue
		    var ang as double =  3.1415926 / 2.0  * v / (MeterMaxValue-MeterMinValue)
		    
		    var sx as double
		    var sy as double
		    
		    var dx as double
		    var dy as double
		    
		    var dv as Double
		    var dvs as String
		    
		    sx = wp * cos(ang)
		    sy = wp - wp * sin(ang)
		    
		    g.FontName = "Arial"
		    g.FontSize = 14
		    g.Bold = False
		    
		    if v mod self.MeterMajorStepValue = 0 then
		      dv = v + MeterMinValue
		      dvs = dv.ToString(nil, self.TickLabelFormat)
		      
		      dx = (wp- 20 - g.TextWidth(dvs) - 5)  * cos(ang)
		      dy = wp - (wp- 20 - g.TextWidth(dvs) - 5) * sin(ang)
		      
		      g.DrawingColor = CommonPaintColor
		      g.DrawText(dvs, MeterXOffset + dx, MeterYOffset + dy)
		      
		      
		      g.PenSize = 3
		      dx = (wp-20)  * cos(ang)
		      dy = wp - (wp-20) * sin(ang)
		      
		    else
		      g.PenSize = 1
		      dx = (wp-10)  * cos(ang)
		      dy = wp - (wp-10) * sin(ang)
		      
		    end if
		    
		    g.DrawingColor = CommonPaintColor
		    g.DrawLine(MeterXOffset + sx,MeterYOffset + sy, MeterXOffset + dx, MeterYOffset + dy)
		    
		    
		  next
		  
		  if MeterLabels.Count > 0 then
		    var maxw as Double = 0
		    var dy as double = 30
		    
		    g.FontName = "Arial"
		    g.FontSize = 20
		    g.Bold = True
		    
		    for each s as string in MeterLabels
		      if g.TextWidth(s) > maxw then maxw = g.TextWidth(s)
		      
		    next
		    
		    g.DrawingColor = CommonPaintColor
		    
		    for each s as string in MeterLabels
		      var dx as double  = g.Width - maxw / 2 - 10 - g.TextWidth(s) /2
		      g.DrawText(s, dx , dy)
		      
		      dy = dy + g.TextHeight(s, 999)
		      
		    next
		    
		  end if
		  
		  return 
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMeterLabels(paramarray labels as string)
		  
		  MeterLabels.RemoveAll
		  
		  for each s as string in labels
		    MeterLabels.Add(s)
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(v as double)
		  
		  self.TargetValue = v
		  
		  if OnTarget then Return
		  
		  self.DeltaForAnimate = (self.TargetValue - self.CurrentValue) / AnimateCallFrequency
		  
		  return 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValueRange(MinValue as double, MaxValue as double, minorStepValue as double, majorStepValue as double)
		  
		  self.MeterMinValue = MinValue
		  self.MeterMaxValue = MaxValue
		  self.MeterMajorStepValue = majorStepValue
		  self.MeterMinorStepValue = minorStepValue
		  self.TickLabelFormat = "##0"
		  
		  return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function valueInRange(v as double, ranges() as Pair) As Boolean
		  
		  for each p as pair in ranges
		    if (p.left <= v) and ( v <= p.right) then return true
		    
		  next
		  
		  return false
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected BackgroundPaintColor As color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CommonPaintColor As color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentValue As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DeltaForAnimate As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MeterBackImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MeterLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MeterMajorStepValue As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MeterMaxValue As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MeterMinorStepValue As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MeterMinValue As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MeterXOffset As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MeterYOffset As double
	#tag EndProperty

	#tag Property, Flags = &h0
		NeedlePaintColor As color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OrangeRanges() As pair
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RedRanges() As pair
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TargetValue As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TickLabelFormat As string
	#tag EndProperty


	#tag Constant, Name = AnimateCallFrequency, Type = Double, Dynamic = False, Default = \"20", Scope = Public
	#tag EndConstant


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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NeedlePaintColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TickLabelFormat"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
