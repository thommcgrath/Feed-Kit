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

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Protected Function Parse(Content As Global.MemoryBlock) As FeedKit.Feed
		  Dim StringValue As String = DefineEncoding(Content, Encodings.UTF8)
		  Return FeedKit.Parse(StringValue.ToText)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Parse(Content As Text) As FeedKit.Feed
		  If Content.Left(1) = "{" Then
		    // JSON
		    Try
		      Dim Dict As Xojo.Core.Dictionary = Xojo.Data.ParseJSON(Content)
		      Return FeedKit.JSON.ParseFeed(Dict)
		    Catch Err As Xojo.Data.InvalidJSONException
		      Return Nil
		    Catch Err As TypeMismatchException
		      Return Nil
		    End Try
		  Else
		    // Not supported
		    Return Nil
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Parse(Content As Xojo.Core.MemoryBlock) As FeedKit.Feed
		  Dim TextValue As Text = Xojo.Core.TextEncoding.UTF8.ConvertDataToText(Content)
		  Return FeedKit.Parse(TextValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToISO8601(Extends Date As Xojo.Core.Date) As Text
		  Dim Offset As Integer = Xojo.Math.Abs(Date.TimeZone.SecondsFromGMT)
		  Dim OffsetHours As Integer = Floor(Offset / 3600)
		  Offset = Offset - (OffsetHours * 3600)
		  Dim OffsetMinutes As Integer = Round(Offset / 60)
		  
		  Dim DatePart As Text = Date.Year.ToText(Nil, "0000") + "-" + Date.Month.ToText(Nil, "00") + "-" + Date.Day.ToText(Nil, "00")
		  Dim TimePart As Text = Date.Hour.ToText(Nil, "00") + ":" + Date.Minute.ToText(Nil, "00") + ":" + Date.Second.ToText(Nil, "00")
		  Dim OffsetPart As Text = if(Date.TimeZone.SecondsFromGMT < 0, "-", "+") + OffsetHours.ToText(Nil, "00") + ":" + OffsetMinutes.ToText(Nil, "00")
		  
		  Return DatePart + "T" + TimePart + OffsetPart
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


End Module
#tag EndModule
