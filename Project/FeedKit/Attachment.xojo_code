#tag Class
Protected Class Attachment
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Source As FeedKit.Attachment)
		  Self.mDuration = Source.mDuration
		  Self.mLength = Source.mLength
		  Self.mMimeType = Source.mMimeType
		  Self.mTitle = Source.mTitle
		  Self.mURL = Source.mURL
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Duration() As UInteger
		  Return Self.mDuration
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Length() As UInteger
		  Return Self.mLength
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MimeType() As Text
		  Return Self.mMimeType
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Title() As Text
		  Return Self.mTitle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URL() As Text
		  Return Self.mURL
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mDuration As UInteger
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLength As UInteger
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mMimeType As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTitle As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mURL As Text
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
			Name="mURL"
			Group="Behavior"
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
