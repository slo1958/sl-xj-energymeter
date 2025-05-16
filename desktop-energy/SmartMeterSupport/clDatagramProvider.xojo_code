#tag Class
Protected Class clDatagramProvider
	#tag Method, Flags = &h1
		Protected Sub DoDatagramreceived(Content as string)
		  
		  DatagramReceived(content)
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoErrorReceived(e As RuntimeException)
		  
		  ErrorReceived(e)
		  return
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastMessage() As string
		  
		  return self.myLastMessage
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestDatagram()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RequestStatus() As integer
		  return StatusIdle
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DatagramReceived(datagram as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ErrorReceived(e as RuntimeException)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected myLastMessage As string
	#tag EndProperty


	#tag Constant, Name = StatusBusy, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StatusGenericError, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StatusIdle, Type = Double, Dynamic = False, Default = \"0", Scope = Public
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
	#tag EndViewBehavior
End Class
#tag EndClass
