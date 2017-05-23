#tag Module
Protected Module FeedKit
	#tag Method, Flags = &h1
		Protected Function DateFromISO8601(Source As Text) As Xojo.Core.Date
		  // No regex because the new framework doesn't support it!
		  
		  Source = Source.Trim
		  
		  Dim Year, Month, Day, Hour, Minute, Second, Offset As Integer
		  
		  Year = Integer.FromText(Source.Left(4))
		  Source = Source.Mid(4)
		  If Source.Left(1) = "-" Then
		    Source = Source.Mid(1)
		  End If
		  Month = Integer.FromText(Source.Left(2))
		  Source = Source.Mid(2)
		  If Source.Left(1) = "-" Then
		    Source = Source.Mid(1)
		  End If
		  Day = Integer.FromText(Source.Left(2))
		  Source = Source.Mid(2)
		  
		  If Source.Length = 0 Or Source.Left(1) <> "T" Then
		    // Date-only
		    Return New Xojo.Core.Date(Year, Month, Day, Hour, Minute, Second, 0, New Xojo.Core.TimeZone(Offset))
		  End If
		  
		  Source = Source.Mid(1)
		  Hour = Integer.FromText(Source.Left(2))
		  Source = Source.Mid(2)
		  If Source.Left(1) = ":" Then
		    Source = Source.Mid(1)
		  End If
		  Minute = Integer.FromText(Source.Left(2))
		  Source = Source.Mid(2)
		  If Source.Left(1) = ":" Then
		    Source = Source.Mid(1)
		  End If
		  Second = Integer.FromText(Source.Left(2))
		  Source = Source.Mid(2)
		  
		  If Source.Length = 0 Or Source.Left(1) = "Z" Then
		    // No or GMT offset
		    Return New Xojo.Core.Date(Year, Month, Day, Hour, Minute, Second, 0, New Xojo.Core.TimeZone(Offset))
		  End If
		  
		  Dim Multiplier As Integer = if(Source.Left(1) = "-", -1, 1)
		  Dim HoursOffset As Integer = Integer.FromText(Source.Mid(1, 2))
		  Dim MinutesOffset As Integer
		  Source = Source.Mid(3)
		  If Source.Length <> 0 And Source.Left(1) = ":" Then
		    Source = Source.Mid(1)
		  End If
		  If Source.Length <> 0 Then
		    MinutesOffset = Integer.FromText(Source)
		  End If
		  
		  Offset = ((HoursOffset * 3600) + (MinutesOffset * 60)) * Multiplier
		  
		  Return New Xojo.Core.Date(Year, Month, Day, Hour, Minute, Second, 0, New Xojo.Core.TimeZone(Offset))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function JSON() As FeedKit.JSON
		  Static Engine As FeedKit.JSON
		  If Engine = Nil Then
		    Engine = New FeedKit.JSON
		  End If
		  Return Engine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Parse(Extends Engine As FeedKit.Engine, Content As Global.MemoryBlock) As FeedKit.Feed
		  Dim StringValue As String = DefineEncoding(Content, Encodings.UTF8)
		  Return Engine.Parse(StringValue.ToText)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parse(Extends Engine As FeedKit.Engine, Content As Xojo.Core.MemoryBlock) As FeedKit.Feed
		  Dim TextValue As Text = Xojo.Core.TextEncoding.UTF8.ConvertDataToText(Content)
		  Return Engine.Parse(TextValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Protected Function Parse(Content As Global.MemoryBlock, AdditionalEngines() As FeedKit.Engine) As FeedKit.Feed
		  Return FeedKit.Parse(DefineEncoding(Content, Encodings.UTF8).ToText, AdditionalEngines)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Protected Function Parse(Content As Global.MemoryBlock, ParamArray AdditionalEngines() As FeedKit.Engine) As FeedKit.Feed
		  Return FeedKit.Parse(Content, AdditionalEngines)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Parse(Content As Text, AdditionalEngines() As FeedKit.Engine) As FeedKit.Feed
		  Dim BuiltInEngines(0) As FeedKit.Engine
		  BuiltInEngines(0) = FeedKit.JSON
		  #if Not TargetiOS
		    BuiltInEngines.Append(FeedKit.RSS)
		  #endif
		  
		  For Each BuiltInEngine As FeedKit.Engine In BuiltInEngines
		    For Each AdditionalEngine As FeedKit.Engine In AdditionalEngines
		      If AdditionalEngine.MimeType = BuiltInEngine.MimeType Then
		        Continue For BuiltInEngine
		      End If
		    Next
		    AdditionalEngines.Append(BuiltInEngine)
		  Next
		  
		  For Each Engine As FeedKit.Engine In AdditionalEngines
		    Try
		      Dim Feed As FeedKit.Feed = Engine.Parse(Content)
		      If Feed <> Nil Then
		        Return Feed
		      End If
		    Catch Err As FeedKit.ParseError
		      Continue
		    End Try
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Parse(Content As Text, ParamArray AdditionalEngines() As FeedKit.Engine) As FeedKit.Feed
		  Return FeedKit.Parse(Content, AdditionalEngines)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Parse(Content As Xojo.Core.MemoryBlock, AdditionalEngines() As FeedKit.Engine) As FeedKit.Feed
		  Return FeedKit.Parse(Xojo.Core.TextEncoding.UTF8.ConvertDataToText(Content), AdditionalEngines)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Parse(Content As Xojo.Core.MemoryBlock, ParamArray AdditionalEngines() As FeedKit.Engine) As FeedKit.Feed
		  Return FeedKit.Parse(Xojo.Core.TextEncoding.UTF8.ConvertDataToText(Content), AdditionalEngines)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Protected Function RSS() As FeedKit.RSS
		  Static Engine As FeedKit.RSS
		  If Engine = Nil Then
		    Engine = New FeedKit.RSS
		  End If
		  Return Engine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToISO8601(Extends Date As Xojo.Core.Date) As Text
		  Dim Offset As Integer = Xojo.Math.Abs(Date.TimeZone.SecondsFromGMT)
		  Dim OffsetHours As Integer = Floor(Offset / 3600)
		  Offset = Offset - (OffsetHours * 3600)
		  Dim OffsetMinutes As Integer = Round(Offset / 60)
		  
		  Dim DatePart As Text = Date.Year.ToText(Xojo.Core.Locale.Raw, "0000") + "-" + Date.Month.ToText(Xojo.Core.Locale.Raw, "00") + "-" + Date.Day.ToText(Xojo.Core.Locale.Raw, "00")
		  Dim TimePart As Text = Date.Hour.ToText(Xojo.Core.Locale.Raw, "00") + ":" + Date.Minute.ToText(Xojo.Core.Locale.Raw, "00") + ":" + Date.Second.ToText(Xojo.Core.Locale.Raw, "00")
		  Dim OffsetPart As Text = if(Date.TimeZone.SecondsFromGMT < 0, "-", "+") + OffsetHours.ToText(Xojo.Core.Locale.Raw, "00") + ":" + OffsetMinutes.ToText(Xojo.Core.Locale.Raw, "00")
		  
		  Return DatePart + "T" + TimePart + OffsetPart
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToRFC822(Extends Date As Xojo.Core.Date) As Text
		  Dim Days(6) As Text
		  Days(0) = "Sun"
		  Days(1) = "Mon"
		  Days(2) = "Tue"
		  Days(3) = "Wed"
		  Days(4) = "Thu"
		  Days(5) = "Fri"
		  Days(6) = "Sat"
		  
		  Dim Months(11) As Text
		  Months(0) = "Jan"
		  Months(1) = "Feb"
		  Months(2) = "Mar"
		  Months(3) = "Apr"
		  Months(4) = "May"
		  Months(5) = "Jun"
		  Months(6) = "Jul"
		  Months(7) = "Aug"
		  Months(8) = "Sep"
		  Months(9) = "Oct"
		  Months(10) = "Nov"
		  Months(11) = "Dec"
		  
		  Dim Offset As Integer = Xojo.Math.Abs(Date.TimeZone.SecondsFromGMT)
		  Dim OffsetHours As Integer = Floor(Offset / 3600)
		  Offset = Offset - (OffsetHours * 3600)
		  Dim OffsetMinutes As Integer = Round(Offset / 60)
		  
		  Dim DayOfWeek As Text = Days(Date.DayOfWeek - 1)
		  Dim MonthName As Text = Months(Date.Month - 1)
		  Dim DatePart As Text = DayOfWeek + ", " + Date.Day.ToText(Xojo.Core.Locale.Raw, "00") + " " + MonthName + " " + Date.Year.ToText(Xojo.Core.Locale.Raw, "0000")
		  Dim TimePart As Text = Date.Hour.ToText(Xojo.Core.Locale.Raw, "00") + ":" + Date.Minute.ToText(Xojo.Core.Locale.Raw, "00") + ":" + Date.Second.ToText(Xojo.Core.Locale.Raw, "00")
		  Dim OffsetPart As Text = if(Date.TimeZone.SecondsFromGMT < 0, "-", "+") + OffsetHours.ToText(Xojo.Core.Locale.Raw, "00") + OffsetMinutes.ToText(Xojo.Core.Locale.Raw, "00")
		  
		  Return DatePart + " " + TimePart + " " + OffsetPart
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UBound(Extends Target As FeedKit.ArrayObject) As Integer
		  Return UBound(Target)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function UBound(Target As FeedKit.ArrayObject) As Integer
		  Return Target.Count - 1
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
