#tag Class
Protected Class Entry
Implements FeedKit.ArrayObject
	#tag Method, Flags = &h0
		Function Attachment(Index As Integer) As FeedKit.Attachment
		  Return New FeedKit.Attachment(Self.mAttachments(Index))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Author() As FeedKit.Author
		  If Self.mAuthor <> Nil Then
		    Return New FeedKit.Author(Self.mAuthor)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BannerURL() As Text
		  Return Self.mBannerURL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Source As FeedKit.Entry)
		  If Source.mAuthor <> Nil Then
		    Self.mAuthor = New FeedKit.Author(Source.mAuthor)
		  End If
		  Self.mBannerURL = Source.mBannerURL
		  Self.mContentHTML = Source.mContentHTML
		  Self.mContentPlain = Source.mContentPlain
		  If Source.mDateModified <> Nil Then
		    Self.mDateModified = New Xojo.Core.Date(Source.mDateModified.SecondsFrom1970, Source.mDateModified.TimeZone)
		  End If
		  If Source.mDatePublished <> Nil Then
		    Self.mDatePublished = New Xojo.Core.Date(Source.mDatePublished.SecondsFrom1970, Source.mDatePublished.TimeZone)
		  End If
		  Self.mExternalURL = Source.mExternalURL
		  Self.mID = Source.mID
		  Self.mImageURL = Source.mImageURL
		  Self.mSummary = Source.mSummary
		  Self.mTitle = Source.mTitle
		  Self.mURL = Source.mURL
		  
		  Redim Self.mAttachments(UBound(Source.mAttachments))
		  For I As Integer = 0 To UBound(Source.mAttachments)
		    Self.mAttachments(I) = New FeedKit.Attachment(Source.mAttachments(I))
		  Next
		  
		  Redim Self.mTags(UBound(Source.mTags))
		  For I As Integer = 0 To UBound(Source.mTags)
		    Self.mTags(I) = Source.mTags(I)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContentHTML() As Text
		  Return Self.mContentHTML
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContentPlain() As Text
		  Return Self.mContentPlain
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return UBound(Self.mAttachments) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DateModified() As Xojo.Core.Date
		  If Self.mDateModified <> Nil Then
		    Return New Xojo.Core.Date(Self.mDateModified.SecondsFrom1970, Self.mDateModified.TimeZone)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DatePublished() As Xojo.Core.Date
		  If Self.mDatePublished <> Nil Then
		    Return New Xojo.Core.Date(Self.mDatePublished.SecondsFrom1970, Self.mDatePublished.TimeZone)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExternalURL() As Text
		  Return Self.mExternalURL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIterator() As Iterator
		  // Part of the Xojo.Core.Iterable interface.
		  
		  Return New FeedKit.Iterator(Self.mAttachments)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ID() As Text
		  Return Self.mID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImageURL() As Text
		  Return Self.mImageURL
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
		Function Operator_Subscript(Index As Integer) As FeedKit.Attachment
		  Return Self.Attachment(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Summary() As Text
		  Return Self.mSummary
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tags() As Text()
		  Dim Out() As Text
		  For Each Tag As Text In Self.mTags
		    Out.Append(Tag)
		  Next
		  Return Out
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
		Protected mAttachments() As FeedKit.Attachment
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mAuthor As FeedKit.Author
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mBannerURL As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mContentHTML As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mContentPlain As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mDateModified As Xojo.Core.Date
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mDatePublished As Xojo.Core.Date
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mExternalURL As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mID As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mImageURL As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mSummary As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTags() As Text
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
			Name="mAttachments()"
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
