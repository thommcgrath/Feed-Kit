#tag Interface
Protected Interface Engine
	#tag Method, Flags = &h0
		Function Generate(Feed As FeedKit.Feed) As Text
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MIMEType() As Text
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parse(Content As Text) As FeedKit.Feed
		  
		End Function
	#tag EndMethod


End Interface
#tag EndInterface
