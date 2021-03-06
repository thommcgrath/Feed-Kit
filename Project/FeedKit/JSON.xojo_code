#tag Class
Protected Class JSON
Implements FeedKit.Engine
	#tag Method, Flags = &h1
		Protected Sub AddIfNotEmpty(Dict As Xojo.Core.Dictionary, Key As Text, Value As Boolean)
		  If Value Then
		    Dict.Value(Key) = Value
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddIfNotEmpty(Dict As Xojo.Core.Dictionary, Key As Text, Value As FeedKit.Attachment)
		  If Value <> Nil Then
		    Dict.Value(Key) = Self.Generate(Value)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddIfNotEmpty(Dict As Xojo.Core.Dictionary, Key As Text, Value As FeedKit.Author)
		  If Value <> Nil Then
		    Dict.Value(Key) = Self.Generate(Value)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddIfNotEmpty(Dict As Xojo.Core.Dictionary, Key As Text, Value As Integer)
		  If Value <> 0 Then
		    Dict.Value(Key) = Value
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddIfNotEmpty(Dict As Xojo.Core.Dictionary, Key As Text, Value() As Text, Separator As Text)
		  If UBound(Value) > -1 Then
		    Dict.Value(Key) = Text.Join(Value, Separator)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddIfNotEmpty(Dict As Xojo.Core.Dictionary, Key As Text, Value As Text)
		  If Value <> "" Then
		    Dict.Value(Key) = Value
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddIfNotEmpty(Dict As Xojo.Core.Dictionary, Key As Text, Value As Xojo.Core.Date)
		  If Value <> Nil Then
		    Dict.Value(Key) = Value.ToISO8601
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Generate(Attachment As FeedKit.Attachment) As Xojo.Core.Dictionary
		  Dim Dict As New Xojo.Core.Dictionary
		  
		  Dict.Value("url") = Attachment.URL
		  Dict.Value("mime_type") = Attachment.MimeType
		  Self.AddIfNotEmpty(Dict, "title", Attachment.Title)
		  Self.AddIfNotEmpty(Dict, "size_in_bytes", Attachment.Length)
		  Self.AddIfNotEmpty(Dict, "duration_in_seconds", Attachment.Duration)
		  
		  RaiseEvent EncodeAttachment(Attachment, Dict)
		  
		  Return Dict
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Generate(Author As FeedKit.Author) As Xojo.Core.Dictionary
		  Dim Dict As New Xojo.Core.Dictionary
		  
		  Self.AddIfNotEmpty(Dict, "name", Author.Name)
		  Self.AddIfNotEmpty(Dict, "url", Author.URL)
		  Self.AddIfNotEmpty(Dict, "avatar", Author.IconURL)
		  
		  RaiseEvent EncodeAuthor(Author, Dict)
		  
		  Return Dict
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Generate(Entry As FeedKit.Entry) As Xojo.Core.Dictionary
		  Dim Attachments() As Xojo.Core.Dictionary
		  For Each Attachment As FeedKit.Attachment In Entry
		    Attachments.Append(Self.Generate(Attachment))
		  Next
		  
		  Dim Dict As New Xojo.Core.Dictionary
		  Dict.Value("id") = Entry.ID
		  Self.AddIfNotEmpty(Dict, "author", Entry.Author)
		  Self.AddIfNotEmpty(Dict, "banner_image", Entry.BannerURL)
		  Self.AddIfNotEmpty(Dict, "content_html", Entry.ContentHTML)
		  Self.AddIfNotEmpty(Dict, "content_text", Entry.ContentPlain)
		  Self.AddIfNotEmpty(Dict, "date_modified", Entry.DateModified)
		  Self.AddIfNotEmpty(Dict, "date_published", Entry.DatePublished)
		  Self.AddIfNotEmpty(Dict, "external_url", Entry.ExternalURL)
		  Self.AddIfNotEmpty(Dict, "image", Entry.ImageURL)
		  Self.AddIfNotEmpty(Dict, "summary", Entry.Summary)
		  Self.AddIfNotEmpty(Dict, "tags", Entry.Tags, ",")
		  Self.AddIfNotEmpty(Dict, "title", Entry.Title)
		  Self.AddIfNotEmpty(Dict, "url", Entry.URL)
		  
		  RaiseEvent EncodeEntry(Entry, Dict)
		  
		  Return Dict
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Generate(Feed As FeedKit.Feed) As Text
		  Dim Items() As Xojo.Core.Dictionary
		  For Each Entry As FeedKit.Entry In Feed
		    Items.Append(Self.Generate(Entry))
		  Next
		  
		  Dim Dict As New Xojo.Core.Dictionary
		  Dict.Value("version") = "https://jsonfeed.org/version/1"
		  Dict.Value("title") = Feed.Title
		  Dict.Value("items") = Items
		  Self.AddIfNotEmpty(Dict, "expired", Feed.Expired)
		  Self.AddIfNotEmpty(Dict, "home_page_url", Feed.SiteURL)
		  Self.AddIfNotEmpty(Dict, "feed_url", Feed.FeedURL)
		  Self.AddIfNotEmpty(Dict, "description", Feed.Description)
		  Self.AddIfNotEmpty(Dict, "user_comment", Feed.UserComment)
		  Self.AddIfNotEmpty(Dict, "next_url", Feed.NextURL)
		  Self.AddIfNotEmpty(Dict, "icon", Feed.IconURL)
		  Self.AddIfNotEmpty(Dict, "favicon", Feed.FavIconURL)
		  Self.AddIfNotEmpty(Dict, "author", Feed.Author)
		  
		  RaiseEvent EncodeFeed(Feed, Dict)
		  
		  Return Xojo.Data.GenerateJSON(Dict)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MimeType() As Text
		  Return "application/json"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parse(Content As Text) As FeedKit.Feed
		  If Content.Left(1) = "{" Then
		    // JSON
		    Try
		      Dim Dict As Xojo.Core.Dictionary = Xojo.Data.ParseJSON(Content)
		      Return Self.ParseFeed(Dict)
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

	#tag Method, Flags = &h21
		Private Function ParseAttachment(Dict As Xojo.Core.Dictionary) As FeedKit.Attachment
		  If Not (Dict.HasKey("url") And Dict.HasKey("mime_type")) Then
		    Raise New FeedKit.ParseError("Attachment requires url and mime_type keys. See https://jsonfeed.org/version/1 for details.")
		  End If
		  
		  Dim Attachment As FeedKit.Attachment = CreateAttachment(Dict)
		  If Attachment = Nil Then
		    Attachment = New FeedKit.Attachment
		  End If
		  Attachment.URL = Dict.Value("url")
		  Attachment.MimeType = Dict.Value("mime_type")
		  
		  If Dict.HasKey("title") Then
		    Attachment.Title = Dict.Value("title")
		  End If
		  If Dict.HasKey("size_in_bytes") Then
		    Attachment.Length = Dict.Value("size_in_bytes")
		  End If
		  If Dict.HasKey("duration_in_seconds") Then
		    Attachment.Duration = Dict.Value("duration_in_seconds")
		  End If
		  
		  Return Attachment
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ParseAuthor(Dict As Xojo.Core.Dictionary) As FeedKit.Author
		  If Not (Dict.HasKey("name") Or Dict.HasKey("avatar") Or Dict.HasKey("url")) Then
		    Raise New FeedKit.ParseError("Author requires one of name, avatar, or url keys. See https://jsonfeed.org/version/1 for details.")
		  End If
		  
		  Dim Author As FeedKit.Author = CreateAuthor(Dict)
		  If Author = Nil Then
		    Author = New FeedKit.Author
		  End If
		  
		  If Dict.HasKey("name") Then
		    Author.Name = Dict.Value("name")
		  End If
		  If Dict.HasKey("avatar") Then
		    Author.IconURL = Dict.Value("avatar")
		  End If
		  If Dict.HasKey("url") Then
		    Author.URL = Dict.Value("url")
		  End If
		  
		  Return Author
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ParseEntry(Dict As Xojo.Core.Dictionary) As FeedKit.Entry
		  If Not (Dict.HasKey("id") And (Dict.HasKey("content_html") Or Dict.HasKey("content_text"))) Then
		    Raise New FeedKit.ParseError("Entries require id and either content_html or content_text keys. See https://jsonfeed.org/version/1 for details.")
		  End If
		  
		  Dim Entry As FeedKit.Entry = CreateEntry(Dict)
		  If Entry = Nil Then
		    Entry = New FeedKit.Entry
		  End If
		  
		  Entry.ID = Dict.Value("id")
		  If Dict.HasKey("content_html") Then
		    Entry.ContentHTML = Dict.Value("content_html")
		  End If
		  If Dict.HasKey("content_text") Then
		    Entry.ContentPlain = Dict.Value("content_plain")
		  End If
		  
		  If Dict.HasKey("external_url") Then
		    Entry.ExternalURL = Dict.Value("external_url")
		  End If
		  If Dict.HasKey("title") Then
		    Entry.Title = Dict.Value("title")
		  End If
		  If Dict.HasKey("summary") Then
		    Entry.Summary = Dict.Value("summary")
		  End If
		  If Dict.HasKey("banner_image") Then
		    Entry.ImageURL = Dict.Value("banner_image")
		  End If
		  If Dict.HasKey("date_published") Then
		    Entry.DatePublished = FeedKit.DateFromISO8601(Dict.Value("date_published"))
		  End If
		  If Dict.HasKey("date_modified") Then
		    Entry.DateModified = FeedKit.DateFromISO8601(Dict.Value("date_modified"))
		  End If
		  If Dict.HasKey("author") Then
		    Entry.Author = Self.ParseAuthor(Dict.Value("author"))
		  End If
		  If Dict.HasKey("tags") Then
		    Dim Tags() As Auto = Dict.Value("tags")
		    Dim Out() As Text
		    For Each Tag As Text In Tags
		      Out.Append(Tag)
		    Next
		    Entry.Tags = Out
		  End If
		  
		  If Dict.HasKey("attachments") Then
		    Dim Items() As Auto = Dict.Value("attachments")
		    For Each Item As Xojo.Core.Dictionary In Items
		      Entry.Append(Self.ParseAttachment(Item))
		    Next
		  End If
		  
		  Return Entry
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ParseFeed(Dict As Xojo.Core.Dictionary) As FeedKit.Feed
		  If Not (Dict.HasKey("title") And Dict.HasKey("version") And Dict.HasKey("items")) Then
		    Raise New FeedKit.ParseError("Feed requires title, version, and items keys. See https://jsonfeed.org/version/1 for details.")
		  End If
		  
		  // Don't actually need the version yet
		  
		  Dim Feed As FeedKit.Feed = CreateFeed(Dict)
		  If Feed = Nil Then
		    Feed = New FeedKit.Feed
		  End If
		  Feed.Title = Dict.Value("title")
		  
		  If Dict.HasKey("home_page_url") Then
		    Feed.SiteURL = Dict.Value("home_page_url")
		  End If
		  If Dict.HasKey("feed_url") Then
		    Feed.FeedURL = Dict.Value("feed_url")
		  End If
		  If Dict.HasKey("description") Then
		    Feed.Description = Dict.Value("description")
		  End If
		  If Dict.HasKey("user_comment") Then
		    Feed.UserComment = Dict.Value("user_comment")
		  End If
		  If Dict.HasKey("next_url") Then
		    Feed.NextURL = Dict.Value("next_url")
		  End If
		  If Dict.HasKey("icon") Then
		    Feed.IconURL = Dict.Value("icon")
		  End If
		  If Dict.HasKey("favicon") Then
		    Feed.FavIconURL = Dict.Value("favicon")
		  End If
		  If Dict.HasKey("author") Then
		    Feed.Author = Self.ParseAuthor(Dict.Value("author"))
		  End If
		  If Dict.HasKey("expired") Then
		    Feed.Expired = Dict.Value("expired")
		  End If
		  
		  Dim Items() As Auto = Dict.Value("items")
		  For Each Item As Xojo.Core.Dictionary In Items
		    Feed.Append(Self.ParseEntry(Item))
		  Next
		  
		  Return Feed
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CreateAttachment(Source As Xojo.Core.Dictionary) As FeedKit.Attachment
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CreateAuthor(Source As Xojo.Core.Dictionary) As FeedKit.Author
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CreateEntry(Source As Xojo.Core.Dictionary) As FeedKit.Entry
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CreateFeed(Source As Xojo.Core.Dictionary) As FeedKit.Feed
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EncodeAttachment(Attachment As FeedKit.Attachment, Data As Xojo.Core.Dictionary)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EncodeAuthor(Author As FeedKit.Author, Data As Xojo.Core.Dictionary)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EncodeEntry(Entry As FeedKit.Entry, Data As Xojo.Core.Dictionary)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EncodeFeed(Feed As FeedKit.Feed, Data As Xojo.Core.Dictionary)
	#tag EndHook


End Class
#tag EndClass
