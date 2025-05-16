#tag Class
Protected Class FlatAnalogCanvas
Inherits DesktopCanvas
Implements itfAnimate
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  
		  var v as double = CurrentValue
		  
		  if v < MeterMinValue then v = MeterMinValue
		  if v > MeterMaxValue then v = MeterMaxValue
		  
		  
		  g.DrawingColor = &cEEEEEE
		  g.FillRectangle(0,0, g.Width, g.Height)
		  
		  var nbstep as integer = (MeterMaxValue - MeterMinValue) / MeterMinorStepValue
		  
		  var stp as Double = g.Width / (2.0 + nbstep)
		  
		  g.DrawingColor = &c000000
		  g.FontName = "Arial"
		  g.FontSize = 12
		  g.Bold = False
		  
		  // Draw orange and red background
		  
		  for each p as pair in array(OrangeStartValue:color.Orange, RedStartValue:&cFF0000)
		    var sx as double = p.Left
		    if sx > 0 then
		      sx = sx - MeterMinValue
		      var wx as Double = g.Width - stp - stp
		      
		      sx = sx / (MeterMaxValue - MeterMinValue) * (g.Width - stp - stp) 
		      wx = wx - sx
		      
		      g.DrawingColor = p.right
		      g.FillRectangle(stp+sx, 5,  wx, 6) 
		      
		    end if
		    
		  next
		  
		  // Draw scale
		  
		  g.DrawingColor = &c030303
		  for i as integer = 0 to nbstep
		    var curv as double = MeterMinValue + i * MeterMinorStepValue
		    if  curv mod MeterMajorStepValue = 0 then 
		      
		      g.DrawLine((i+1)*stp , 5, (i+1)*stp,15)
		      
		      var ts as string = format(curv, self.TickLabelFormat )
		      
		      var tx as Double = g.TextWidth(ts)
		      
		      if i=0 then
		        tx = (i+1)*stp
		        
		      elseif i=nbstep then
		        tx = (nbstep+1)*stp - tx
		      else
		        tx = (i+1)*stp - tx/2
		        
		      end if
		      
		      g.DrawText(ts, tx , 25)
		      
		    else
		      g.DrawLine((i+1)*stp , 5, (i+1)*stp,10)
		      
		    end if
		    
		    
		    
		  next
		  
		  
		  
		  /////////////
		  
		  if MeterLabels.Count > 0 then 
		    
		    g.FontName = "Arial"
		    g.FontSize = 20
		    g.Bold = True
		    
		    var dy as double = 18 + g.TextHeight("W",99999)
		    
		    g.DrawingColor = &c030303
		    for each s as string in MeterLabels
		      var dx as double  = (g.Width - g.TextWidth(s))/ 2
		      g.DrawText(s, dx, dy)
		      
		      dy = dy + 15
		      
		    next
		    
		  end if
		  
		  ////////////
		  
		  var tmp as Double = v - MeterMinValue
		  tmp = tmp / (MeterMaxValue - MeterMinValue) * (g.Width - stp - stp) 
		  
		  g.DrawingColor = &cCCCCCCBB
		  g.PenSize = 7
		  g.Drawline(stp + tmp-3, 5, stp + tmp-3, 33)
		  
		  g.PenSize = 3
		  g.DrawingColor = &cFF0000
		  g.Drawline(stp + tmp-1, 5, stp + tmp-1, 30)
		  
		  // Draw shading 
		  g.PenSize = 1
		  var cl as Color = rgb(1, 1, 1)
		  
		  for i as integer = 0 to 60
		    cl = RGB(1,1,1,135+i+i)
		    
		    g.DrawingColor = cl
		    g.DrawLine(i, 0, i, g.Height)
		    
		    g.Drawline(g.Width-i, 0, g.Width-i, g.Height)
		    
		  next
		  
		End Sub
	#tag EndEvent


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
		  
		  return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OnTarget() As Boolean
		  return abs(self.TargetValue - self.CurrentValue) < 0.01
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLimits(OrangeLimit as Double, redLimit as Double)
		  
		  self.OrangeStartValue = OrangeLimit
		  
		  self.RedStartValue = RedLimit
		  
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


	#tag Property, Flags = &h0
		CurrentValue As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		DeltaForAnimate As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		MeterLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MeterMajorStepValue As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		MeterMaxValue As double
	#tag EndProperty

	#tag Property, Flags = &h0
		MeterMinorStepValue As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		MeterMinValue As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		OrangeStartValue As double
	#tag EndProperty

	#tag Property, Flags = &h0
		RedStartValue As double
	#tag EndProperty

	#tag Property, Flags = &h0
		TargetValue As Double
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
			Name="MeterMaxValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MeterMinValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MeterMajorStepValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MeterMinorStepValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TargetValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DeltaForAnimate"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="OrangeStartValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RedStartValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
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
