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
		  Dim BuildDate As Xojo.Core.Date
		  If UBound(Dates) > -1 Then
		    BuildDate = Dates(UBound(Dates))
		  End If
		  
		  Dim Document As New XMLDocument
		  
		  Dim Root As XMLNode = Document.AppendChild(Document.CreateElement("rss"))
		  Root.SetAttribute("version", "2.0")
		  
		  Dim Channel As XMLNode = Root.AppendChild(Document.CreateElement("channel"))
		  Self.Append(Document, Channel, "title", Feed.Title, False)
		  Self.Append(Document, Channel, "link", Feed.SiteURL, False)
		  Self.Append(Document, Channel, "description", Feed.Description, False)
		  Self.Append(Document, Channel, "lastBuildDate", BuildDate)
		  
		  If Feed.IconURL <> "" Then
		    Dim Image As XMLNode = Channel.AppendChild(Document.CreateElement("image"))
		    Self.Append(Document, Image, "url", Feed.IconURL)
		    Self.Append(Document, Image, "title", Feed.Title)
		    Self.Append(Document, Image, "link", Feed.SiteURL)
		  End If
		  
		  For Each Entry As FeedKit.Entry In Feed
		    Self.Append(Document, Channel, Entry)
		  Next
		  
		  Return Document.Transform(Self.PrettyTransform).ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MIMEType() As Text
		  Return "application/rss+xml"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parse(Content As Text) As FeedKit.Feed
		  If Content.Length < 5 Or Content.Left(5) <> "<?xml" Then
		    Return Nil
		  End If
		  
		  Dim Document As XMLDocument
		  Try
		    Document = New XMLDocument(Content)
		  Catch Err As XmlException
		    Raise New FeedKit.ParseError(Err.Message.ToText)
		  End Try
		  
		  Dim Root As XmlElement = Document.DocumentElement
		  If Root.Name <> "rss" Then
		    Return Nil
		  End If
		  If Root.GetAttribute("version") <> "2.0" Then
		    Return Nil
		  End If
		  
		  Dim Feed As New FeedKit.MutableFeed
		  Dim Channel As XmlNode = Root.FirstChild
		  For I As Integer = 0 To Channel.ChildCount - 1
		    Dim Child As XmlNode = Channel.Child(I)
		    Select Case Child.Name
		    Case "title"
		      Feed.Title = Self.TextValue(Child)
		    Case "link"
		      Feed.SiteURL = Self.TextValue(Child)
		    Case "description"
		      Feed.Description = Self.TextValue(Child)
		    Case "image"
		      Feed.IconURL = Self.TextValue(Self.Search(Child, "url"))
		    Case "item"
		      Dim Entry As FeedKit.Entry = Self.ParseEntry(Child)
		      If Entry <> Nil Then
		        Feed.Append(Entry)
		      End If
		    End Select
		  Next
		  
		  Return New FeedKit.Feed(Feed)
		  
		  Exception Err As RuntimeException
		    Raise New FeedKit.ParseError(Err.Message.ToText)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseEntry(Element As XMLNode) As FeedKit.Entry
		  If Element = Nil Or Element.Name <> "item" Then
		    Return Nil
		  End If
		  
		  Dim Entry As New FeedKit.MutableEntry
		  For I As Integer = 0 To Element.ChildCount - 1
		    Dim Child As XMLNode = Element.Child(I)
		    Select Case Child.Name
		    Case "title"
		      Entry.Title = Self.TextValue(Child)
		    Case "pubDate"
		      // Need to parse the publish date
		    Case "guid"
		      Entry.ID = Self.TextValue(Child)
		    Case "description"
		      Entry.ContentHTML = Self.TextValue(Child)
		    End Select
		  Next
		  Return New FeedKit.Entry(Entry)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Search(Element As XMLNode, Tag As String) As XMLNode
		  If Element = Nil Or Element.ChildCount = 0 Then
		    Return Nil
		  End If
		  
		  For I As Integer = 0 To Element.ChildCount - 1
		    If Element.Child(I).Name = Tag Then
		      Return Element.Child(I)
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TextValue(Element As XMLNode) As Text
		  If Element = Nil Then
		    Return ""
		  End If
		  If Element.FirstChild <> Nil And Element.FirstChild IsA XMLTextNode Then
		    Return Element.FirstChild.Value.ToText
		  End If
		End Function
	#tag EndMethod


	#tag Constant, Name = PrettyTransform, Type = String, Dynamic = False, Default = \"<\?xml version\x3D\"1.0\" encoding\x3D\"UTF-8\"\?>\n<xsl:transform version\x3D\"1.0\" xmlns:xsl\x3D\"http://www.w3.org/1999/XSL/Transform\">\n    <xsl:output method\x3D\"xml\" indent\x3D\"yes\" />\n    <xsl:template match\x3D\"/\">\n        <xsl:copy-of select\x3D\"/\" />\n    </xsl:template>\n</xsl:transform>", Scope = Protected
	#tag EndConstant


End Class
#tag EndClass
