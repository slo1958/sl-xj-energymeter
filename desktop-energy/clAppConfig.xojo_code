#tag Class
Protected Class clAppConfig
	#tag Method, Flags = &h0
		Sub CheckParams()
		  
		  self.powerMeterFromNetwork.Validate
		  self.powerMeterToNetwork.Validate
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  self.powerMeterFromNetwork = new clMeterConfig("PowerFromNetwork")
		  self.powerMeterToNetwork = new clMeterConfig("PowerToNetwork")
		  self.voltageMeters = new clMeterConfig("Voltage")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConnectionMode() As string
		  
		  if self.ConnectionMode = "HTTP" or self.ConnectionMode = "TCP" then return self.ConnectionMode
		  
		  return "TCP"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDBFilePath() As FolderItem
		  if self.DBFilePath.Length = 0 then
		    return SpecialFolder.Desktop
		    
		  elseif self.DBFilePath.Uppercase = "OFF" then
		    return nil
		    
		  elseif self.DBFilePath.Uppercase="DESKTOP" then
		    return SpecialFolder.Desktop
		    
		  elseif self.DBFilePath.Uppercase="DOCUMENTS" then
		    return SpecialFolder.Documents
		    
		  else
		    return new FolderItem(self.DBFilePath)
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMeterIPAddress() As string
		  Return IPAddress
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMeterPortNumber() As integer
		  Return PortNumber
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMeterURL() As string
		  Return URL_Meter
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResumePollingDelayMinimum() As integer
		  Return self.ResumePollingDelayMinimum
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResumePollingDelaySeconds() As integer
		  if self.ResumePollingDelay < self.ResumePollingDelayMinimum then
		    return self.ResumePollingDelayMinimum
		    
		  elseif self.ResumePollingDelay > 300 then
		    return 300
		    
		  else
		    return self.ResumePollingDelay
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeOutDelay() As integer
		  if self.TimeOutDelay < 5 then
		    return 5
		    
		  elseif self.TimeOutDelay > 120 then
		    return 120
		    
		  else
		    return self.TimeOutDelay
		    
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUpdatePeriodSeconds() As integer
		  if self.UpdatePeriod < 2 then
		    return 5
		    
		  elseif self.UpdatePeriod > 300 then
		    Return 300
		    
		  else
		    Return self.UpdatePeriod
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(SourceFolder as FolderItem)
		  
		  var f as FolderItem = SourceFolder
		  
		  f = f.Child("MeterConfig.txt")
		  
		  var analogMeterConfig as integer = 0
		  var powerMeterFromNetworkConfig as integer = 0
		  var powerMeterToNetworkConfig as integer = 0
		  var voltageMeterConfig as integer = 0
		  
		  if f.Exists then
		    var tin as TextInputStream = TextInputStream.Open(f)
		    
		    while not tin.EndOfFile
		      var s as string = tin.ReadLine
		      
		      if s.trim.Length = 0 then 
		        
		      elseif s.trim.left(1)="#" then
		        
		      else
		        var splitAt as integer = s.IndexOf(" ")
		        var idx as integer = s.left(splitAt).Trim.ToInteger
		        var value as string = s.middle(splitAt,999).Trim
		        
		        if value.indexof("/#") > 0 then value = value.left(value.IndexOf("/#"))
		        
		        select case idx
		        case 1 
		          self.URL_Meter = value
		          
		        case 2 
		          self.TimeOutDelay = value.Trim.ToInteger
		          
		        case 3
		          self.UpdatePeriod = value.Trim.ToInteger
		          
		        case 4
		          self.ResumePollingDelay = value.Trim.ToInteger
		          
		        case 21
		          self.IPAddress = value.trim
		          
		        Case 22
		          self.PortNumber = value.trim.ToInteger
		          
		        case 23
		          self.ConnectionMode = value.Trim.Uppercase
		          
		        case 100
		          analogMeterConfig = value.trim.ToInteger
		          
		        case 102 + analogMeterConfig
		          AnalogMeterBackgroundColor = color.FromString(value)
		          
		        case 101 + analogMeterConfig
		          AnalogMeterTicksColor = color.FromString(value)
		          
		        case 103 + analogMeterConfig
		          AnalogMeterNeedleColor = color.FromString(value)
		          
		        case 200
		          powerMeterFromNetworkConfig = value.Trim.ToInteger
		          
		        case 201 + powerMeterFromNetworkConfig to 299+powerMeterFromNetworkConfig
		          self.powerMeterFromNetwork.SetValue(idx - powerMeterFromNetworkConfig - 200, value)
		          
		        case 300
		          powerMeterToNetworkConfig = value.Trim.ToInteger
		          
		        case 301 + powerMeterToNetworkConfig to 399+powerMeterToNetworkConfig
		          self.powerMeterToNetwork.SetValue(idx - powerMeterToNetworkConfig - 300, value)
		          
		        case 400
		          voltageMeterConfig = value.Trim.ToInteger
		          
		        case 401 + voltageMeterConfig to 499+voltageMeterConfig
		          self.voltageMeters.SetValue(idx - voltageMeterConfig - 400, value)
		          
		        case 900
		          self.DBFilePath = value.Trim
		          
		        case else
		          System.DebugLog("Cannot process [" + s + "]")
		          
		        end select
		      end if
		      
		    wend
		    
		    tin.Close
		    
		  else
		    self.SetDefaults
		    
		  end if
		  
		  self.powerMeterFromNetwork.DumpToLog
		  self.powerMeterToNetwork.DumpToLog
		  self.voltageMeters.DumpToLog
		  
		  CheckParams
		  
		  
		  ConfigFIle = f
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  // var temp as FolderItem 
		  // 
		  // if self.ConfigFIle.Exists then
		  // temp = self.ConfigFIle.Parent.Child("backup_" + self.ConfigFIle.Name)
		  // 
		  // if temp.Exists then temp.Remove
		  // 
		  // self.ConfigFIle.CopyTo(temp)
		  // 
		  // else 
		  // temp = nil
		  // 
		  // end if
		  // 
		  // System.DebugLog("Saving config.")
		  // 
		  // try
		  // var tout as TextOutputStream = TextOutputStream.Create(self.ConfigFIle)
		  // 
		  // tout.WriteLine("00 " + DateTime.Now.SQLDateTime)
		  // tout.WriteLine("01 " + URL_Meter)
		  // 
		  // tout.Close
		  // 
		  // if temp <> nil then
		  // temp.Remove
		  // 
		  // end if
		  // 
		  // System.DebugLog("Config saved.")
		  // Catch 
		  // 
		  // System.DebugLog("Cannot save config. ")
		  // 
		  // end try
		  // 
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDefaults()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMeterURL(new_url as String)
		  
		  self.URL_Meter = new_url
		  
		  self.save
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AnalogMeterBackgroundColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		AnalogMeterNeedleColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		AnalogMeterTicksColor As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ConfigFIle As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ConnectionMode As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DBFilePath As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected IPAddress As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PortNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		powerMeterFromNetwork As clMeterConfig
	#tag EndProperty

	#tag Property, Flags = &h0
		powerMeterToNetwork As clMeterConfig
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ResumePollingDelay As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TimeOutDelay As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private UpdatePeriod As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private URL_Meter As String
	#tag EndProperty

	#tag Property, Flags = &h0
		voltageMeters As clMeterConfig
	#tag EndProperty


	#tag Constant, Name = ResumePollingDelayMinimum, Type = Double, Dynamic = False, Default = \"15", Scope = Private
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
			Name="AnalogMeterBackgroundColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AnalogMeterNeedleColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AnalogMeterTicksColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="color"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
