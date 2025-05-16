#tag Class
Protected Class clMeterIndex
Inherits WebCanvas
	#tag Event
		Sub Opening()
		  self.digitWidth = 20.0
		  self.digitHeight = 20.0
		  self.digitOffset = 2.0
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As WebGraphics)
		   
		  
		  const fontSize = 20
		  
		  var xbase  as double = 1
		  
		  var p as picture = new Picture(self.UsefullWidth, g.Height, 32)
		  
		  var ydraw as Double = 25.0
		  
		  var decimalPart as Boolean = false
		  
		  p.Graphics.DrawingColor =  &c000000
		  p.Graphics.FillRectangle(0,0, self.UsefullWidth, g.Height)
		  
		  p.Graphics.FontName = "Helvetica"
		  p.Graphics.FontSize = fontSize
		  
		  p.Graphics.Bold = True
		  
		  for each s as string in CurrentValue.Characters
		    
		    if decimalPart then
		      p.Graphics.DrawingColor = if(decimalPart, &cFF0000, &c000000)
		      p.Graphics.FillRectangle(xbase, ydraw-digitHeight,  digitWidth, digitHeight+5)
		      
		    end if
		    
		    
		    var w as double = p.Graphics.TextWidth(s)
		    var d as Double = (digitWidth - w ) / 2
		    
		    p.Graphics.DrawingColor = &cFFFFFF
		    
		    p.Graphics.DrawText(s, xbase + d, ydraw)
		      
		    if s = "." or s = "," then
		      decimalPart = True
		      
		    else
		      p.Graphics.PenSize = 0.5
		      p.Graphics.DrawRectangle(xbase, ydraw-digitHeight, digitWidth, digitHeight+5)
		      
		    end if
		    
		    xbase = xbase + digitWidth + digitOffset
		    
		  next
		  
		  g.DrawPicture(p, 0, 0)
		  
		  CurrentDisplayedValue = CurrentValue
		  
		  return 
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub SetIndex(index as double)
		  
		  CurrentValue= format(index, "000000.000")
		  
		  if CurrentValue <> CurrentDisplayedValue then self.Refresh(false)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrentDisplayedValue As string
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentValue As String
	#tag EndProperty

	#tag Property, Flags = &h0
		digitHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		digitOffset As double
	#tag EndProperty

	#tag Property, Flags = &h0
		digitWidth As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return  10 * (self.digitWidth + self.digitOffset)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			   
			End Set
		#tag EndSetter
		UsefullWidth As Double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="PanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Visual Controls"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indicator"
			Visible=false
			Group="Visual Controls"
			InitialValue=""
			Type="WebUIControl.Indicators"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Primary"
				"2 - Secondary"
				"3 - Success"
				"4 - Danger"
				"5 - Warning"
				"6 - Info"
				"7 - Light"
				"8 - Dark"
				"9 - Link"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControlID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DiffEngineDisabled"
			Visible=true
			Group="Canvas"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="LockBottom"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentDisplayedValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="digitWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="digitHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="digitOffset"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UsefullWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
