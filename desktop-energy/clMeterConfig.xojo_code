#tag Class
Protected Class clMeterConfig
	#tag Method, Flags = &h0
		Sub Constructor(myName as string)
		  self.name = myName.trim
		  self.LabelFormat = "#####0"
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DumpToLog()
		  
		  Var myProperties() As Introspection.PropertyInfo = Introspection.GetType(self).GetProperties
		  
		  var tmp as string
		  For Each prop As Introspection.PropertyInfo In myProperties
		    tmp = self.name + "." + prop.name 
		    tmp = tmp + ":" + prop.Value(self).StringValue
		    
		    System.DebugLog(tmp)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(ValueIndex as integer, ValueString as string)
		  select case ValueIndex 
		    
		  case 1 
		    self.Minimum = ValueString.Trim.ToInteger
		    
		  case 2
		    self.Maximum = ValueString.Trim.ToInteger
		    
		  case 3 
		    self.MajorTicks  = ValueString.Trim.ToInteger
		    
		  case 4  
		    self.MinorTicks  = ValueString.Trim.ToInteger
		    
		  case 5  
		    self.Scale = ValueString.Trim.ToInteger
		    
		  case 6 
		    self.LabelFormat = ValueString.trim
		    
		  case 7
		    self.OrangeRangeStart = ValueString.Trim.ToInteger
		    
		  case 8
		    self.OrangeRangeEnd = ValueString.Trim.ToInteger
		    
		  case 9
		    self.RedRangeStart = ValueString.Trim.ToInteger
		    
		  case 10
		    self.RedRangeEnd = ValueString.Trim.ToInteger
		    
		  else
		    
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Validate()
		  
		  if self.Minimum >= self.Maximum then
		    WriteToLog("Minimum forced to zero")
		    self.Minimum=0
		    
		  end if
		  
		  if self.Scale <> 1 and self.Scale <> 1000 then
		    WriteToLog("Scale set to 1.")
		    self.scale = 1
		    
		  end if
		  
		  if self.MajorTicks < self.MinorTicks then
		    if self.MajorTicks = 0 then
		      self.MajorTicks = self.Maximum / 2
		      WriteToLog("Major ticks set to " + str(self.MajorTicks))
		    else
		      self.MajorTicks = self.MinorTicks/ 4
		      WriteToLog("Minor ticks set to " + str(self.MinorTicks))
		      
		      
		    end if
		  end if
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteToLog(message as string)
		  
		  System.DebugLog(name + ":  " + message)
		  
		  return
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		LabelFormat As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MajorTicks As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Maximum As double
	#tag EndProperty

	#tag Property, Flags = &h0
		Minimum As double
	#tag EndProperty

	#tag Property, Flags = &h0
		MinorTicks As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		OrangeRangeEnd As double
	#tag EndProperty

	#tag Property, Flags = &h0
		OrangeRangeStart As double
	#tag EndProperty

	#tag Property, Flags = &h0
		RedRangeEnd As double
	#tag EndProperty

	#tag Property, Flags = &h0
		RedRangeStart As double
	#tag EndProperty

	#tag Property, Flags = &h0
		Scale As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="name"
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
			Name="Minimum"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LabelFormat"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorTicks"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Maximum"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorTicks"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="OrangeRangeEnd"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="OrangeRangeStart"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RedRangeEnd"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RedRangeStart"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Scale"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
