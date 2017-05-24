#tag Class
Protected Class Attachment
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Duration As UInteger
	#tag EndProperty

	#tag Property, Flags = &h0
		Length As UInteger
	#tag EndProperty

	#tag Property, Flags = &h0
		MIMEType As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		URL As Text
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
