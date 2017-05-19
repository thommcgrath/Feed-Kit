#tag Class
Protected Class MutableEntry
Inherits FeedKit.Entry
	#tag Method, Flags = &h0
		Sub Append(Attachment As FeedKit.Attachment)
		  If Attachment = Nil Then
		    Return
		  End If
		  
		  Dim Idx As Integer = Self.IndexOf(Attachment)
		  If Idx = -1 Then
		    Self.mAttachments.Append(New FeedKit.Attachment(Attachment))
		  End If
		End Sub
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
		  
		  Self.mAttachments(Index) = New FeedKit.Attachment(Value)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Author(Assigns Value As FeedKit.Author)
		  If Value <> Nil Then
		    Self.mAuthor = New FeedKit.Author(Value)
		  Else
		    Self.mAuthor = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BannerURL(Assigns Value As Text)
		  Self.mBannerURL = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor
		  
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
		  
		  Self.mID = Text.Join(Chars, "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContentHTML(Assigns Value As Text)
		  Self.mContentHTML = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContentPlain(Assigns Value As Text)
		  Self.mContentPlain = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DateModified(Assigns Value As Xojo.Core.Date)
		  If Value <> Nil Then
		    Self.mDateModified = New Xojo.Core.Date(Value.SecondsFrom1970, Value.TimeZone)
		  Else
		    Self.mDateModified = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DatePublished(Assigns Value As Xojo.Core.Date)
		  If Value <> Nil Then
		    Self.mDatePublished = New Xojo.Core.Date(Value.SecondsFrom1970, Value.TimeZone)
		  Else
		    Self.mDatePublished = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExternalURL(Assigns Value As Text)
		  Self.mExternalURL = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ID(Assigns Value As Text)
		  Self.mID = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImageURL(Assigns Value As Text)
		  Self.mImageURL = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Index As Integer, Attachment As FeedKit.Attachment)
		  If Attachment = Nil Then
		    Return
		  End If
		  
		  Dim Idx As Integer = Self.IndexOf(Attachment)
		  If Idx = -1 Then
		    Self.mAttachments.Insert(Index, New FeedKit.Attachment(Attachment))
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Redim(Bound As Integer)
		  Redim Self.mAttachments(Bound)
		End Sub
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

	#tag Method, Flags = &h0
		Sub Summary(Assigns Value As Text)
		  Self.mSummary = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Tags(Assigns Value() As Text)
		  Redim Self.mTags(UBound(Value))
		  For I As Integer = 0 To UBound(Value)
		    Self.mTags(I) = Value(I)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Title(Assigns Value As Text)
		  Self.mTitle = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub URL(Assigns Value As Text)
		  Self.mURL = Value
		End Sub
	#tag EndMethod


End Class
#tag EndClass
