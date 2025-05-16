#tag Class
Protected Class clTCPDatgramProvider
Inherits clDatagramProvider
	#tag Method, Flags = &h0
		Sub Constructor(DatagramSourceURL as string, DatagramSourcePort as integer, requestTimeOut as integer)
		  
		  
		  self.URL = DatagramSourceURL
		  self.Port = DatagramSourcePort
		  
		  
		  if requestTimeOut < 5 then 
		    self.timeout = 10
		    
		  else
		    self.TimeOut = requestTimeOut
		    
		  end if
		  
		  self.Socket = new TCPSocket()
		  
		  AddHandler self.Socket.DataAvailable, Addressof SocketDataAvailable
		  AddHandler socket.Error, AddressOf SocketErrorReceived
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasError() As Boolean
		  
		  return self.MyRequestStatus < 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestDatagram()
		  // Calling the overridden superclass method.
		  Super.RequestDatagram()
		  
		  select case self.MyRequestStatus
		    
		  case self.StatusIdle 
		    self.MyRequestStatus = StatusBusy
		    
		    Self.Received = ""
		    self.ReceivedEnd = ""
		    
		    self.myLastMessage = "Sending reques to " + url + " port " + str(self.Port) + "..."
		    
		    
		    socket.Address =  self.URL
		    socket.Port = self.Port
		    
		    socket.Connect
		    
		    // Wait for connection
		    var ttm as double 
		    var ttm_limit as Double
		    
		    
		    ttm = System.Microseconds
		    
		    ttm_limit = ttm + 10000000
		    
		    // Wait for connection
		    While Not socket.IsConnected and ttm < ttm_limit and not HasError
		      socket.Poll
		      ttm = System.Microseconds
		      
		    Wend
		    
		    If not socket.IsConnected Then
		      self.MyRequestStatus = StatusGenericError
		      
		      var e as new RuntimeException
		      e.ErrorNumber = 999
		      e.Message = "TimeOut"
		      
		      DoErrorReceived(e)
		      
		      Return
		      
		    end if
		    
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
		Sub Reset()
		  // Calling the overridden superclass method.
		  Super.Reset()
		  
		  self.MyRequestStatus = StatusIdle
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SocketDataAvailable(Socket As TCPSocket)
		  
		  // Wait for "/"
		  var temp as string = self.Socket.ReadAll
		  
		  if self.Received.Bytes = 0 then 
		    if temp.IndexOf("/") < 0 then return
		    
		    self.Received = temp.Middle(temp.IndexOf("/"), 999)
		    Return
		  end if
		  
		  for each s as string in temp.characters
		    if ReceivedEnd.bytes > 0 and ReceivedEnd.bytes < 5 then
		      ReceivedEnd = ReceivedEnd + s
		      
		    elseif ReceivedEnd.bytes > 0 then // ignore
		      
		    elseif s="!" then
		      ReceivedEnd = s
		      
		    else
		      self.Received = self.Received + s
		      
		    end if
		  next
		  
		  if self.ReceivedEnd.bytes = 5 then
		    self.Socket.Disconnect
		    self.myLastMessage = "Datagram received from " + self.URL +" port " + self.Port.ToString
		    DoDatagramreceived(Received + ReceivedEnd)
		    self.myRequestStatus = self.StatusIdle
		    self.RequestCountWhileBusy = 0
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SocketErrorReceived(Socket As TCPSocket, e As RuntimeException)
		  
		  if e.ErrorNumber = 102 and self.ReceivedEnd.bytes = 5 then
		    // we disconnect, so do not propagate error
		    
		  else
		    self.myLastMessage =  e.Message
		    self.myRequestStatus = StatusGenericError
		    
		    DoErrorReceived(e)
		    
		    System.DebugLog(e.Message + " " + e.ErrorNumber.ToString)
		    
		  end if
		  
		  return
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private MyRequestStatus As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Port As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Received As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ReceivedEnd As string
	#tag EndProperty

	#tag Property, Flags = &h0
		RequestCountWhileBusy As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Socket As TCPSocket
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
			Name="Received"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReceivedEnd"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
