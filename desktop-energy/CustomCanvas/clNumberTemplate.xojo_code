#tag Class
Protected Class clNumberTemplate
	#tag Method, Flags = &h0
		Sub Constructor()
		  self.symbolHeight = 24
		  self.symbolWidth = 20
		  self.SymbolBackColor = &c000000
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DigitBackColor(assigns c as Color)
		  self.SymbolBackColor = c
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DigitHeight() As Double
		  
		  return self.symbolHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DigitHeight(assigns n as Double)
		  symbolHeight = n
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DigitWidth() As Double
		  return symbolWidth 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DigitWidth(assigns n as Double)
		  symbolWidth = n
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrepareTemplate()
		  
		  self.NumberTemplate = new Picture(symbolWidth, symbolHeight*11, 32)
		  
		  var g as Graphics = NumberTemplate.Graphics
		  
		  g.DrawingColor = self.SymbolBackColor
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  
		  g.FontName = "Arial"
		  g.FontSize = 20
		  g.Bold = True
		  
		  g.DrawingColor = &cFFFFFF
		  
		  var charAscent as Double = g.FontAscent
		  
		  
		  var curY as Double = 0
		  
		  // Symbols used have no part below baseline. 
		  var charYOffset as Double = (symbolHeight - charAscent)/2
		  
		  for i as integer = 0 to 10
		    var s as string = i.ToString.Right(1)
		    var w as Double = (symbolWidth - g.TextWidth(s))/2
		    
		    g.DrawText(s, w, curY+symbolHeight - charYOffset)
		    curY = cury + symbolHeight
		    
		  next
		  
		  
		  
		  Return
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		NumberTemplate As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SymbolBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private symbolHeight As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private symbolWidth As double
	#tag EndProperty


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
			InitialValue="-2147483648"
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
			Name="NumberTemplate"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
