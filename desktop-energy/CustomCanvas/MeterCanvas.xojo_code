#tag Class
Protected Class MeterCanvas
Inherits DesktopCanvas
Implements itfAnimate
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  
		  if MainDigitTemplate = nil then Return
		  if decimalDigitTemplate = nil then Return
		  
		  var w as double  = self.MainDigitTemplate.NumberTemplate.Width
		  var h as Double = self.MainDigitTemplate.DigitHeight
		  var tempOffset  as Double 
		  var horizOffset as Double = (CountMainDigits + CountDecimalDigits - 1) * w
		  
		  for i as integer = 0 to DigitsVerticalOffset.LastIndex
		    
		    tempOffset = totalVerticalOffset(i)
		    
		    if i < CountDecimalDigits then
		      g.DrawPicture(self.decimalDigitTemplate.NumberTemplate, horizOffset,-tempOffset, w, tempOffset+h)
		      
		    else
		      g.DrawPicture(self.MainDigitTemplate.NumberTemplate, horizOffset,-tempOffset, w, tempOffset+h)
		      
		    end if
		    
		    horizOffset = horizOffset - w
		    
		  next
		  
		  
		  var picwidth as double = (CountMainDigits + CountDecimalDigits) * w
		  
		  var shadowStep as integer = 128 / Self.ShadowSize
		  
		  for i as integer = 0 to self.ShadowSize
		    
		    g.DrawingColor = Color.RGB(0, 0, 0, 128 + i * shadowStep)
		    
		    
		    g.DrawLine(0, i, picwidth, i)
		    g.DrawLine(0, MainDigitTemplate.DigitHeight-i, picwidth, MainDigitTemplate.DigitHeight- i)
		    
		  next
		  
		  Return
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function AllDigits(startIndex as integer, expectedDigits() as integer) As Boolean
		  
		  //if startIndex = 0 then return false
		  
		  for i as integer= 0 to startIndex
		    if expectedDigits.IndexOf(DigitsVerticalOffset(i)) < 0 then return false
		    
		  next
		  
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Animate()
		  // 
		  
		  var tempDisplayedNumber as double = self.DisplayedNumber
		  
		  if abs(tempDisplayedNumber - self.TargetNumber) < 0.001  then
		    self.CounterDirection = 0
		    return
		    
		  end if
		  
		  
		  self.Refresh(False)
		  
		  var doneUpdateDigits as boolean 
		  var digitIndex as integer  
		  var pixelStep as double = self.PixelUpdateEachAnimate 
		  
		  if  self.CounterDirection > 0 then // should increase
		    
		    if totalVerticalOffset(0) >= MainDigitTemplate.DigitHeight * 10 - 5 then
		      PixelVerticalOffset = totalVerticalOffset(0) - MainDigitTemplate.DigitHeight * 10 + pixelStep
		      DigitsVerticalOffset(0) = 0
		      doneUpdateDigits = False
		      digitIndex = 1
		      
		      while not doneUpdateDigits and digitIndex < DigitsVerticalOffset.LastIndex
		        DigitsVerticalOffset(digitIndex) = DigitsVerticalOffset(digitIndex) + 1
		        
		        if DigitsVerticalOffset(digitIndex) > 9 then
		          DigitsVerticalOffset(digitIndex) = 0
		          digitIndex = digitIndex + 1
		          
		        else
		          doneUpdateDigits = True
		          
		        end if
		        
		        
		      wend
		      
		    elseif PixelVerticalOffset + pixelStep >= MainDigitTemplate.DigitHeight then 
		      DigitsVerticalOffset(0) = DigitsVerticalOffset(0) + 1
		      PixelVerticalOffset = 0 
		      
		      
		    else
		      PixelVerticalOffset = PixelVerticalOffset + pixelStep
		      
		    end if
		    
		  elseif self.CounterDirection < 0 then
		    
		    if PixelVerticalOffset - pixelStep < 0 then
		      DigitsVerticalOffset(0) = DigitsVerticalOffset(0) - 1
		      PixelVerticalOffset =  MainDigitTemplate.DigitHeight   - pixelStep
		      
		      if DigitsVerticalOffset(0)<0 then 
		        DigitsVerticalOffset(0) = 9
		        doneUpdateDigits = False
		        digitIndex = 1
		        
		        while not doneUpdateDigits and digitIndex < DigitsVerticalOffset.LastIndex
		          DigitsVerticalOffset(digitIndex) = DigitsVerticalOffset(digitIndex) - 1
		          
		          
		          if DigitsVerticalOffset(digitIndex) = 0 then
		            DigitsVerticalOffset(digitIndex) = 10
		            
		            doneUpdateDigits = True
		            
		          elseif DigitsVerticalOffset(digitIndex) = 9 then
		            digitIndex = digitIndex + 1
		            
		          else
		            doneUpdateDigits = True
		            
		          end if
		          
		          
		        wend
		        
		      end if
		      
		    else
		      PixelVerticalOffset = PixelVerticalOffset  - pixelStep
		      
		      
		    end if
		    
		  end if
		  
		  
		  if self.PixelUpdateEachAnimate <= 0 then // Display number without anumation
		    
		    Return
		  end if
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Configure(MainDigit as clNumberTemplate, decimalDigit as clNumberTemplate, format as string)
		  
		  self.MainDigitTemplate = MainDigit
		  
		  if decimalDigit = nil then
		    self.decimalDigitTemplate = MainDigit
		    
		  else
		    self.decimalDigitTemplate = decimalDigit
		    
		  end if
		  
		  self.SetNumberFormat(format)
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DisplayedNumber() As double
		  
		  var temp as Double
		  
		  var tempscale as Double = 1 / NumberScaleFactor
		  
		  // special case for digit 0
		  
		  
		  if self.CounterDirection > 0 then
		    temp = DigitsVerticalOffset(0) 
		    
		  elseif self.CounterDirection < 0 then
		    if PixelVerticalOffset < 2 then
		      temp = DigitsVerticalOffset(0) 
		      
		    else
		      temp = DigitsVerticalOffset(0) + 1
		      
		    end if
		    
		    
		  else
		    temp = DigitsVerticalOffset(0) 
		    
		  end if
		  
		  temp = temp * tempscale
		  
		  for i as integer = 1 to DigitsVerticalOffset.LastIndex
		    tempscale = tempscale * 10
		    temp = temp + DigitsVerticalOffset(i) * tempscale
		    
		  next 
		  
		  return temp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OnTarget() As boolean
		  return self.CounterDirection = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetNumberFormat(format as string)
		  
		  self.NumberFormat = format.ReplaceAll("#","0").Replace(",","")
		  
		  if format.IndexOf(".") < 0 then
		    CountMainDigits = format.Length
		    CountDecimalDigits = 0
		    
		    NumberScaleFactor = 1
		    
		  else
		    CountMainDigits = format.IndexOf(".")
		    CountDecimalDigits = format.Length - CountMainDigits -1
		    
		    NumberScaleFactor = 10 ^ CountDecimalDigits
		    
		  end if
		  
		  
		  DigitsVerticalOffset.ResizeTo(CountMainDigits + CountDecimalDigits - 1)
		  
		  for i as integer = 0 to DigitsVerticalOffset.LastIndex
		    DigitsVerticalOffset(i) = 0
		    
		  next
		  
		  
		  self.ShadowSize = 10
		  
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function totalVerticalOffset(digitNumber as integer) As Double
		  
		  if digitNumber = 0 then
		    return DigitsVerticalOffset(0) * MainDigitTemplate.DigitHeight  + PixelVerticalOffset
		    
		  elseif AllDigits(digitNumber - 1,array(9)) and self.CounterDirection > 0 then
		    return DigitsVerticalOffset(digitNumber) * MainDigitTemplate.DigitHeight + PixelVerticalOffset
		    
		  elseif  AllDigits(digitNumber-1, array(0,10)) and self.CounterDirection < 0 then
		    return (DigitsVerticalOffset(digitNumber)-1) * MainDigitTemplate.DigitHeight + PixelVerticalOffset
		    
		  else
		    return DigitsVerticalOffset(digitNumber) * MainDigitTemplate.DigitHeight 
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateNumber(d as Double)
		  
		  
		  if MainDigitTemplate = nil then Return
		  if decimalDigitTemplate = nil then Return
		  
		  self.TargetNumber = round(d*NumberScaleFactor)/NumberScaleFactor
		  
		  // if current number is zero, we jump to the target
		  // otherwise, we calculate the number of pixel shifts we need
		  // Update period tells us how many second before next update
		  // 
		  
		  if self.DisplayedNumber <= 0 then 
		    var tmp as string = format(d, NumberFormat).Replace(",","").Replace(".","")
		    var index as integer = DigitsVerticalOffset.LastIndex
		    
		    for each s as string in tmp.Characters
		      DigitsVerticalOffset(index) = s.ToInteger
		      
		      index = index - 1
		    next
		    
		    
		    self.PixelUpdateEachAnimate = -1
		    self.CounterDirection = 1
		    
		    self.Refresh(false)
		    Return
		    
		  end if
		  
		  var totalPixelShifts as Double = (self.TargetNumber - self.DisplayedNumber) * NumberScaleFactor * MainDigitTemplate.DigitHeight
		  
		  var tempNumberOfCallsToUpdate as Double = app.config.GetUpdatePeriodSeconds * AnimateCallFrequency
		  
		  self.PixelUpdateEachAnimate   = abs( totalPixelShifts / tempNumberOfCallsToUpdate)
		  
		  self.CounterDirection = sign( self.TargetNumber - self.DisplayedNumber)
		  
		  Return
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private CountDecimalDigits As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CounterDirection As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CountMainDigits As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private decimalDigitTemplate As clNumberTemplate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DigitsVerticalOffset() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MainDigitTemplate As clNumberTemplate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NumberFormat As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NumberScaleFactor As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PixelUpdateEachAnimate As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PixelVerticalOffset As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ShadowSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TargetNumber As Double
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
	#tag EndViewBehavior
End Class
#tag EndClass
