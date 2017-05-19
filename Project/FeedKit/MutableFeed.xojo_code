#tag Class
Protected Class MutableFeed
Inherits FeedKit.Feed
	#tag Method, Flags = &h0
		Sub Append(Entry As FeedKit.Entry)
		  If Entry = Nil Then
		    Return
		  End If
		  
		  Dim Idx As Integer = Self.IndexOf(Entry)
		  If Idx = -1 Then
		    Self.mEntries.Append(New FeedKit.Entry(Entry))
		  End If
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
		Sub Constructor()
		  Super.Constructor()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Description(Assigns Value As Text)
		  Self.mDescription = Value
		End Sub
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
		  
		  Self.mEntries(Index) = New FeedKit.Entry(Value)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Expired(Assigns Value As Boolean)
		  Self.mExpired = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FavIconURL(Assigns Value As Text)
		  Self.mFavIconURL = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FeedURL(Assigns Value As Text)
		  Self.mFeedURL = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IconURL(Assigns Value As Text)
		  Self.mIconURL = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Index As Integer, Entry As FeedKit.Entry)
		  If Entry = Nil Then
		    Return
		  End If
		  
		  Dim Idx As Integer = Self.IndexOf(Entry)
		  If Idx = -1 Then
		    Self.mEntries.Insert(Index, New FeedKit.Entry(Entry))
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NextURL(Assigns Value As Text)
		  Self.mNextURL = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Redim(Bound As Integer)
		  Redim Self.mEntries(Bound)
		End Sub
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

	#tag Method, Flags = &h0
		Sub SiteURL(Assigns Value As Text)
		  Self.mSiteURL = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Title(Assigns Value As Text)
		  Self.mTitle = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserComment(Assigns Value As Text)
		  Self.mUserComment = Value
		End Sub
	#tag EndMethod


End Class
#tag EndClass
