#tag Class
Protected Class clMeterTelegram
	#tag Method, Flags = &h0
		Sub Constructor(SourceText as string)
		  self.d = new Dictionary
		  
		  self.parse(SourceText.ReplaceAll(chr(10),""))
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCounterRawValue(counter_id as string) As string
		  var s() as string
		  
		  s = self.d.lookup(counter_id, s)
		  
		  if s.Count > 0 then
		    return s(0)
		    
		  else
		    return ""
		    
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCounterValue(counter_id as string) As double
		  var temp as string = self.GetCounterRawValue(counter_id)
		  var unit as string
		  
		  if temp = "" then return 0
		  
		  var pos_star as integer = temp.IndexOf("*")
		  
		  if pos_star >= 0 then 
		    unit = temp.middle(pos_star+1, 99)
		    
		    temp = temp.Left(pos_star)
		    
		  end if
		  
		  var ret as Double = val(temp)
		  
		  return ret
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCounterValueAndUnit(counter_id as string) As pair
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse(Source as string)
		  //0-0:96.1.4(50217)
		  
		  
		  
		  var lines() as string = source.Split(chr(13))
		  
		  for each line as String in lines
		    var temp_res() as string
		    var temp_line as string = line
		    
		    var pos_colon as integer = temp_line.IndexOf(":")
		    var pos_open_par as integer = temp_line.IndexOf("(")
		    
		    if pos_colon >=0 then
		      var counter_prefix as string = temp_line.left(pos_colon-1).Trim
		      var counter_id as string = temp_line.Middle(pos_colon+1, pos_open_par-pos_colon-1).trim
		      
		      temp_line = temp_line.Middle(pos_open_par, 999)
		      pos_open_par  = temp_line.IndexOf("(")
		      
		      while pos_open_par >= 0
		        var pos_close_par as integer = temp_line.IndexOf(")")
		         
		        var counter_value as string = temp_line.Middle(pos_open_par+1, pos_close_par - pos_open_par -1)
		        
		        temp_res.Add(counter_value)
		        
		        temp_line = temp_line.middle(pos_close_par+1, 999)
		        
		        pos_open_par  = temp_line.IndexOf("(")
		      wend
		      
		      
		      d.value(counter_id) = temp_res
		      
		    end if
		    
		    
		  next
		  
		  
		  Return
		End Sub
	#tag EndMethod


	#tag Note, Name = Example Telegram
		
		/FLU5\253769484_A
		
		0-0:96.1.4(50217)
		0-0:96.1.1(3153414733313030373136393537)
		0-0:1.0.0(250502164035S)
		1-0:1.8.1(002601.234*kWh)
		1-0:1.8.2(003437.690*kWh)
		1-0:2.8.1(003902.111*kWh)
		1-0:2.8.2(001623.307*kWh)
		0-0:96.14.0(0001)
		1-0:1.4.0(00.000*kW)
		1-0:1.6.0(250501101500S)(01.194*kW)
		0-0:98.1.0(13)(1-0:1.6.0)(1-0:1.6.0)(230801000000S)(632525252525W)(00.000*kW)(240601000000S)(240523000000S)(03.701*kW)(240701000000S)(240612214500S)(03.297*kW)(240801000000S)(240724220000S)(03.090*kW)(240901000000S)(240830221500S)(03.378*kW)(241001000000S)(240924210000S)(03.649*kW)(241101000000W)(241003201500S)(04.113*kW)(241201000000W)(241121233000W)(04.428*kW)(250101000000W)(241227191500W)(07.211*kW)(250201000000W)(250114081500W)(05.494*kW)(250301000000W)(250213194500W)(04.987*kW)(250401000000S)(250314164500W)(04.323*kW)(250501000000S)(250416203000S)(03.535*kW)
		1-0:1.7.0(00.000*kW)
		1-0:2.7.0(03.516*kW)
		1-0:21.7.0(00.000*kW)
		1-0:41.7.0(00.138*kW)
		1-0:61.7.0(00.000*kW)
		1-0:22.7.0(02.078*kW)
		1-0:42.7.0(00.000*kW)
		1-0:62.7.0(01.576*kW)
		1-0:32.7.0(243.6*V)
		1-0:52.7.0(240.9*V)
		1-0:72.7.0(243.0*V)
		1-0:31.7.0(008.54*A)
		1-0:51.7.0(000.81*A)
		1-0:71.7.0(006.59*A)
		0-0:96.3.10(1)
		0-0:17.0.0(999.9*kW)
		1-0:31.4.0(999*A)
		0-0:96.13.0()
		!838B
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		d As Dictionary
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
