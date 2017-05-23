#tag Class
Protected Class MutableAuthor
Inherits FeedKit.Author
	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Email(Assigns Value As Text)
		  Self.mEmail = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IconURL(Assigns Value As Text)
		  Self.mIconURL = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Name(Assigns Value As Text)
		  Self.mName = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub URL(Assigns Value As Text)
		  Self.mURL = Value
		End Sub
	#tag EndMethod


End Class
#tag EndClass
