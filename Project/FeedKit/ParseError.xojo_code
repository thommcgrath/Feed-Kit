#tag Class
Protected Class ParseError
Inherits RuntimeException
	#tag Method, Flags = &h0
		Sub Constructor(Explanation As Text)
		  Self.Reason = Explanation
		  #if Not TargetiOS
		    Self.Message = Explanation
		  #endif
		End Sub
	#tag EndMethod


End Class
#tag EndClass
