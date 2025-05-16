#tag Class
Protected Class clAppConfig
	#tag Method, Flags = &h0
		Function GetMeterURL() As string
		  Return URL_Meter
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(SourceFolder as FolderItem)
		  
		  var f as FolderItem = SourceFolder
		  
		  f = f.Child("MeterConfig.txt")
		  
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
		        
		        
		        if idx = 1 then self.URL_Meter = value.trim
		        
		      end if
		      
		    wend
		    
		    tin.Close
		    
		  else
		    self.SetDefaults
		    
		  end if
		  
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


	#tag Property, Flags = &h21
		Private ConfigFIle As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private URL_Meter As String
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
	#tag EndViewBehavior
End Class
#tag EndClass
