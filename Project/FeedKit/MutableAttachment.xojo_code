#tag Class
Protected Class MutableAttachment
Inherits FeedKit.Attachment
	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Duration(Assigns Value As UInteger)
		  Self.mDuration = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Length(Assigns Value As UInteger)
		  Self.mLength = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MimeType(Assigns Value As Text)
		  Self.mMimeType = Value
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
