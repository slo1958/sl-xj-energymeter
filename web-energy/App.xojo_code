#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Opening(args() As String)
		  self.config = new clAppConfig
		  
		  self.config.load(SpecialFolder.Desktop)
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		config As clAppConfig
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
