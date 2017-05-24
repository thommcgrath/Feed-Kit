#tag Class
Protected Class Feed
Implements FeedKit.ArrayObject
	#tag Method, Flags = &h0
		Sub Append(Entry As FeedKit.Entry)
		  If Entry = Nil Then
		    Return
		  End If
		  
		  Dim Idx As Integer = Self.IndexOf(Entry)
		  If Idx = -1 Then
		    Self.mEntries.Append(Entry)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return UBound(Self.mEntries) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Entry(Index As Integer) As FeedKit.Entry
		  Return Self.mEntries(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Entry(Index As Integer, Assigns Value As FeedKit.Entry)
		  If Value = Nil Then
		    Return
		  End If
		  
		  Dim Idx As Integer = Self.IndexOf(Value)
		  If Idx = -1 Or Idx = Index Then
		    Return
		  End If
		  
		  Self.mEntries(Index) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIterator() As Iterator
		  // Part of the Xojo.Core.Iterable interface.
		  
		  Return New FeedKit.Iterator(Self.mEntries)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(Needle As FeedKit.Entry) As Integer
		  For I As Integer = 0 To UBound(Self.mEntries)
		    If Self.mEntries(I) = Needle Then
		      Return I
		    End If
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Index As Integer, Entry As FeedKit.Entry)
		  If Entry = Nil Then
		    Return
		  End If
		  
		  Dim Idx As Integer = Self.IndexOf(Entry)
		  If Idx = -1 Then
		    Self.mEntries.Insert(Index, Entry)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Redim(Bound As Integer)
		  Redim Self.mEntries(Bound)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subscript(Index As Integer) As FeedKit.Entry
		  Return Self.Entry(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Subscript(Index As Integer, Assigns Value As FeedKit.Entry)
		  Self.Entry(Index) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Entry As FeedKit.Entry)
		  If Entry = Nil Then
		    Return
		  End If
		  
		  Dim Idx As Integer = Self.IndexOf(Entry)
		  If Idx > -1 Then
		    Self.Remove(Idx)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Index As Integer)
		  Self.mEntries.Remove(Index)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Author As FeedKit.Author
	#tag EndProperty

	#tag Property, Flags = &h0
		Description As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Expired As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FavIconURL As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		FeedURL As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		IconURL As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEntries() As FeedKit.Entry
	#tag EndProperty

	#tag Property, Flags = &h0
		NextURL As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		SiteURL As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		UserComment As Text
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
