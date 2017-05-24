#tag Class
Protected Class Entry
Implements FeedKit.ArrayObject
	#tag Method, Flags = &h0
		Sub Append(Attachment As FeedKit.Attachment)
		  If Attachment = Nil Then
		    Return
		  End If
		  
		  Dim Idx As Integer = Self.IndexOf(Attachment)
		  If Idx = -1 Then
		    Self.mAttachments.Append(Attachment)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Attachment(Index As Integer) As FeedKit.Attachment
		  Return Self.mAttachments(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Attachment(Index As Integer, Assigns Value As FeedKit.Attachment)
		  If Value = Nil Then
		    Return
		  End If
		  
		  Dim Idx As Integer = Self.IndexOf(Value)
		  If Idx = -1 Or Idx = Index Then
		    Return
		  End If
		  
		  Self.mAttachments(Index) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Dim Bytes As Xojo.Core.MemoryBlock = Xojo.Crypto.GenerateRandomBytes(16)
		  Dim Id As New Xojo.Core.MutableMemoryBlock(Bytes)
		  Dim Value As UInt8
		  
		  Value = Id.UInt8Value(6)
		  Value = Value And CType(&b00001111, UInt8)
		  Value = Value Or CType(&b01000000, UInt8)
		  Id.UInt8Value(6) = Value
		  
		  Value = Id.UInt8Value(8)
		  Value = Value And CType(&b00111111, UInt8)
		  Value = Value Or CType(&b10000000, UInt8)
		  Id.UInt8Value(8) = Value
		  
		  Dim Chars() As Text
		  For I As Integer = 0 To Id.Size - 1
		    Chars.Append(Id.UInt8Value(I).ToHex(2))
		  Next
		  
		  Chars.Insert(10, "-")
		  Chars.Insert( 8, "-")
		  Chars.Insert( 6, "-")
		  Chars.Insert( 4, "-")
		  
		  Self.ID = Text.Join(Chars, "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return UBound(Self.mAttachments) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIterator() As Iterator
		  // Part of the Xojo.Core.Iterable interface.
		  
		  Return New FeedKit.Iterator(Self.mAttachments)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(Needle As FeedKit.Attachment) As Integer
		  For I As Integer = 0 To UBound(Self.mAttachments)
		    If Self.mAttachments(I) = Needle Then
		      Return I
		    End If
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Index As Integer, Attachment As FeedKit.Attachment)
		  If Attachment = Nil Then
		    Return
		  End If
		  
		  Dim Idx As Integer = Self.IndexOf(Attachment)
		  If Idx = -1 Then
		    Self.mAttachments.Insert(Index, Attachment)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(Other As FeedKit.Entry) As Integer
		  If Other = Nil Then
		    Return 1
		  End If
		  
		  If Self.ID = Other.ID Then
		    Return 0
		  End If
		  
		  Return Self.Title.Compare(Other.Title, Text.CompareCaseSensitive)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Redim(Bound As Integer)
		  Redim Self.mAttachments(Bound)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subscript(Index As Integer) As FeedKit.Attachment
		  Return Self.Attachment(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Subscript(Index As Integer, Assigns Value As FeedKit.Attachment)
		  Self.Attachment(Index) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Attachment As FeedKit.Attachment)
		  If Attachment = Nil Then
		    Return
		  End If
		  
		  Dim Idx As Integer = Self.IndexOf(Attachment)
		  If Idx > -1 Then
		    Self.Remove(Idx)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Index As Integer)
		  Self.mAttachments.Remove(Index)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Author As FeedKit.Author
	#tag EndProperty

	#tag Property, Flags = &h0
		BannerURL As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		ContentHTML As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		ContentPlain As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		DateModified As Xojo.Core.Date
	#tag EndProperty

	#tag Property, Flags = &h0
		DatePublished As Xojo.Core.Date
	#tag EndProperty

	#tag Property, Flags = &h0
		ExternalURL As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		ID As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		ImageURL As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAttachments() As FeedKit.Attachment
	#tag EndProperty

	#tag Property, Flags = &h0
		Summary As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Tags() As Text
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
