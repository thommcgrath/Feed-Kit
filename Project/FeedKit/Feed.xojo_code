#tag Class
Protected Class Feed
Implements FeedKit.ArrayObject
	#tag Method, Flags = &h0
		Function Author() As FeedKit.Author
		  If Self.mAuthor <> Nil Then
		    Return New FeedKit.Author(Self.mAuthor)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Source As FeedKit.Feed)
		  If Source.mAuthor <> Nil Then
		    Self.mAuthor = New FeedKit.Author(Source.mAuthor)
		  End If
		  Self.mDescription = Source.mDescription
		  Self.mExpired = Source.mExpired
		  Self.mFavIconURL = Source.mFavIconURL
		  Self.mFeedURL = Source.mFeedURL
		  Self.mIconURL = Source.mIconURL
		  Self.mNextURL = Source.mNextURL
		  Self.mSiteURL = Source.mSiteURL
		  Self.mTitle = Source.mTitle
		  Self.mUserComment = Source.mUserComment
		  Redim Self.mEntries(UBound(Source.mEntries))
		  For I As Integer = 0 To UBound(Source.mEntries)
		    Self.mEntries(I) = New FeedKit.Entry(Source.mEntries(I))
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return UBound(Self.mEntries) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Description() As Text
		  Return Self.mDescription
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Entry(Index As Integer) As FeedKit.Entry
		  Return New FeedKit.Entry(Self.mEntries(Index))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Expired() As Boolean
		  Return Self.mExpired
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FavIconURL() As Text
		  Return Self.mFavIconURL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FeedURL() As Text
		  Return Self.mFeedURL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIterator() As Iterator
		  // Part of the Xojo.Core.Iterable interface.
		  
		  Return New FeedKit.Iterator(Self.mEntries)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IconURL() As Text
		  Return Self.mIconURL
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
		Function NextURL() As Text
		  Return Self.mNextURL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subscript(Index As Integer) As FeedKit.Entry
		  Return Self.Entry(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SiteURL() As Text
		  Return Self.mSiteURL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Title() As Text
		  Return Self.mTitle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserComment() As Text
		  Return Self.mUserComment
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mAuthor As FeedKit.Author
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mDescription As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEntries() As FeedKit.Entry
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mExpired As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mFavIconURL As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mFeedURL As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mIconURL As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mNextURL As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mSiteURL As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTitle As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mUserComment As Text
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
