#tag Class
Protected Class RSS
Implements FeedKit.Engine
	#tag CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
	#tag Method, Flags = &h1
		Protected Sub Append(Document As XMLDocument, Parent As XMLNode, Value As FeedKit.Attachment)
		  If Value = Nil Then
		    Return
		  End If
		  
		  Dim Enclosure As XMLNode = Parent.AppendChild(Document.CreateElement("enclosure"))
		  Enclosure.SetAttribute("url", Value.URL)
		  Enclosure.SetAttribute("length", Str(Value.Length, "-0"))
		  Enclosure.SetAttribute("type", Value.MimeType)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Append(Document As XMLDocument, Parent As XMLNode, Value As FeedKit.Entry)
		  If Value = Nil Then
		    Return
		  End If
		  
		  Dim Item As XMLNode = Parent.AppendChild(Document.CreateElement("item"))
		  Self.Append(Document, Item, "title", Value.Title, False)
		  Self.Append(Document, Item, "link", Value.URL)
		  Self.Append(Document, Item, "pubDate", Value.DatePublished)
		  
		  Dim GUID As XMLNode = Item.AppendChild(Document.CreateElement("guid"))
		  Dim ID As Text = Value.ID
		  If ID.IndexOf("://") = -1 Then
		    GUID.SetAttribute("isPermaLink", "false")
		  End If
		  GUID.AppendChild(Document.CreateTextNode(Value.ID))
		  
		  If Value.Author <> Nil Then
		    Self.Append(Document, Item, "author", Value.Author.Email)
		  End If
		  
		  If Value.ExternalURL <> "" Then
		    Dim Source As XMLNode = Item.AppendChild(Document.CreateElement("source"))
		    Source.SetAttribute("url", Value.ExternalURL)
		    Source.AppendChild(Document.CreateTextNode(Value.Title))
		  End If
		  
		  Self.Append(Document, Item, "description", if(Value.ContentHTML <> "", Value.ContentHTML, Value.ContentPlain), False)
		  
		  For Each Attachment As FeedKit.Attachment In Value
		    Self.Append(Document, Item, Attachment)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Append(Document As XMLDocument, Parent As XMLNode, Name As String, Value As Integer, OmitEmpty As Boolean = True)
		  If Value <> 0 Or OmitEmpty = False Then
		    Self.Append(Document, Parent, Name, Str(Value, "-0"), OmitEmpty)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Append(Document As XMLDocument, Parent As XMLNode, Name As String, Value As String, OmitEmpty As Boolean = True)
		  If Value <> "" Or OmitEmpty = False Then
		    Dim Node As XMLNode = Document.CreateElement(Name)
		    Node.AppendChild(Document.CreateTextNode(Value))
		    Parent.AppendChild(Node)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Append(Document As XMLDocument, Parent As XMLNode, Name As String, Value As Xojo.Core.Date, OmitEmpty As Boolean = True)
		  If Value <> Nil Then
		    Self.Append(Document, Parent, Name, Value.ToRFC822, OmitEmpty)
		  ElseIf OmitEmpty = False Then
		    Self.Append(Document, Parent, Name, "", OmitEmpty)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Generate(Feed As FeedKit.Feed) As Text
		  Dim Dates() As Xojo.Core.Date
		  Dim Seconds() As Integer
		  For Each Entry As FeedKit.Entry In Feed
		    Dim PubDate As Xojo.Core.Date = Entry.DatePublished
		    Dim ModDate As Xojo.Core.Date = Entry.DateModified
		    If PubDate <> Nil Then
		      Dates.Append(PubDate)
		      Seconds.Append(PubDate.SecondsFrom1970)
		    End If
		    If ModDate <> Nil Then
		      Dates.Append(ModDate)
		      Seconds.Append(ModDate.SecondsFrom1970)
		    End If
		  Next
		  Seconds.SortWith(Dates)
		  
		  Dim Document As New XMLDocument
		  
		  Dim Root As XMLNode = Document.AppendChild(Document.CreateElement("rss"))
		  Root.SetAttribute("version", "2.0")
		  
		  Dim Channel As XMLNode = Root.AppendChild(Document.CreateElement("channel"))
		  Self.Append(Document, Channel, "title", Feed.Title, False)
		  Self.Append(Document, Channel, "link", Feed.SiteURL, False)
		  Self.Append(Document, Channel, "description", Feed.Description, False)
		  Self.Append(Document, Channel, "lastBuildDate", Dates(UBound(Dates)))
		  
		  If Feed.IconURL <> "" Then
		    Dim Image As XMLNode = Channel.AppendChild(Document.CreateElement("image"))
		    Self.Append(Document, Image, "url", Feed.IconURL)
		    Self.Append(Document, Image, "title", Feed.Title)
		    Self.Append(Document, Image, "link", Feed.SiteURL)
		  End If
		  
		  For Each Entry As FeedKit.Entry In Feed
		    Self.Append(Document, Channel, Entry)
		  Next
		  
		  Return Document.ToString.ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MIMEType() As Text
		  Return "application/rss+xml"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parse(Content As Text) As FeedKit.Feed
		  
		End Function
	#tag EndMethod


End Class
#tag EndClass
