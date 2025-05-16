#tag Class
Protected Class clHTTPDatagramProvider
Inherits clDatagramProvider
	#tag Method, Flags = &h0
		Sub Constructor(DatagramSourceURL as string, requestTimeOut as integer)
		  
		  
		  self.MyRequestStatus = StatusIdle
		  
		  // var url as string = app.config.GetMeterURL()
		  
		  if DatagramSourceURL.left(4) <> "http" and DatagramSourceURL.left(5) <> "https" then
		    self.url = "http://" + DatagramSourceURL
		    
		  else
		    self.URL = DatagramSourceURL
		    
		  end if
		  
		  System.DebugLog(self.url)
		  
		  // var timeout as integer = app.config.GetTimeOutDelay
		  
		  if requestTimeOut < 5 then 
		    self.timeout = 10
		    
		  else
		    self.TimeOut = requestTimeOut
		    
		  end if
		  
		  self.RequestCountWhileBusy = 0
		  
		  self.Connection = new URLConnection()
		  
		  AddHandler self.Connection.ContentReceived, AddressOf HTTPContentReceived
		  AddHandler self.Connection.Error, addressof HTTPErrorReceived
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HTTPContentReceived(Connection As URLConnection, URL As String, HTTPStatus As Integer, content As String)
		  
		  self.myLastMessage = "Datagram received from " + self.URL
		  self.myRequestStatus = self.StatusIdle
		  self.RequestCountWhileBusy = 0
		  
		  DoDatagramReceived(content)
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HTTPErrorReceived(Connection As URLConnection, e As RuntimeException)
		  
		  self.myLastMessage =  e.Message
		  self.myRequestStatus = self.StatusGenericError
		  self.RequestCountWhileBusy = 0
		  
		  DoErrorReceived(e)
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestDatagram()
		  // Calling the overridden superclass method.
		  Super.RequestDatagram()
		  
		  select case self.MyRequestStatus
		    
		  case self.StatusIdle 
		    self.myLastMessage  = "Sending request to " + url + "..."
		    
		    self.MyRequestStatus = self.StatusBusy
		    self.RequestCountWhileBusy = 0
		    
		    Connection.Send("GET",url,timeout)
		    
		    Return
		    
		    
		  case self.StatusBusy
		    if self.RequestCountWhileBusy > 3 then
		      var e as new RuntimeException
		      e.ErrorNumber = 999
		      e.Message = "TimeOut"
		      
		      DoErrorReceived(e)
		      
		      Return
		      
		    else
		      self.RequestCountWhileBusy = self.RequestCountWhileBusy + 1
		      
		    end if
		    
		    return
		    
		    
		  case self.StatusGenericError
		    Return
		    
		  case else
		    Return
		    
		  end select
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RequestStatus() As integer
		  // Calling the overridden superclass method.
		  
		  return self.MyRequestStatus
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  // Calling the overridden superclass method.
		  Super.Reset()
		  
		  
		  if self.Connection <> nil then
		    RemoveHandler self.Connection.ContentReceived, AddressOf HTTPContentReceived
		    RemoveHandler self.Connection.Error, addressof HTTPErrorReceived
		    
		    self.Connection.Disconnect
		    self.Connection = nil
		    
		  end if
		  
		  self.Connection = new URLConnection()
		  
		  AddHandler self.Connection.ContentReceived, AddressOf HTTPContentReceived
		  AddHandler self.Connection.Error, addressof HTTPErrorReceived
		  
		  self.MyRequestStatus = self.StatusIdle
		  
		  Return
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Connection As URLConnection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MyRequestStatus As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		RequestCountWhileBusy As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TimeOut As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private URL As String
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
			Name="RequestCountWhileBusy"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
