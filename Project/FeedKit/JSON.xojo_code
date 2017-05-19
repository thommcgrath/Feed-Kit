#tag Module
Private Module JSON
	#tag Method, Flags = &h1
		Protected Function ParseAttachment(Dict As Xojo.Core.Dictionary) As FeedKit.Attachment
		  If Not (Dict.HasKey("url") And Dict.HasKey("mime_type")) Then
		    Raise New FeedKit.ParseError("Attachment requires url and mime_type keys. See https://jsonfeed.org/version/1 for details.")
		  End If
		  
		  Dim Attachment As New FeedKit.MutableAttachment
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
		  
		  Return New FeedKit.Attachment(Attachment)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseAuthor(Dict As Xojo.Core.Dictionary) As FeedKit.Author
		  If Not (Dict.HasKey("name") Or Dict.HasKey("avatar") Or Dict.HasKey("url")) Then
		    Raise New FeedKit.ParseError("Author requires one of name, avatar, or url keys. See https://jsonfeed.org/version/1 for details.")
		  End If
		  
		  Dim Author As New FeedKit.MutableAuthor
		  
		  If Dict.HasKey("name") Then
		    Author.Name = Dict.Value("name")
		  End If
		  If Dict.HasKey("avatar") Then
		    Author.IconURL = Dict.Value("avatar")
		  End If
		  If Dict.HasKey("url") Then
		    Author.URL = Dict.Value("url")
		  End If
		  
		  Return New FeedKit.Author(Author)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseEntry(Dict As Xojo.Core.Dictionary) As FeedKit.Entry
		  If Not (Dict.HasKey("id") And (Dict.HasKey("content_html") Or Dict.HasKey("content_text"))) Then
		    Raise New FeedKit.ParseError("Entries require id and either content_html or content_text keys. See https://jsonfeed.org/version/1 for details.")
		  End If
		  
		  Dim Entry As New FeedKit.MutableEntry
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
		    Entry.Author = ParseAuthor(Dict.Value("author"))
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
		      Entry.Append(ParseAttachment(Item))
		    Next
		  End If
		  
		  Return New FeedKit.Entry(Entry)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseFeed(Dict As Xojo.Core.Dictionary) As FeedKit.Feed
		  If Not (Dict.HasKey("title") And Dict.HasKey("version") And Dict.HasKey("items")) Then
		    Raise New FeedKit.ParseError("Feed requires title, version, and items keys. See https://jsonfeed.org/version/1 for details.")
		  End If
		  
		  // Don't actually need the version yet
		  
		  Dim Feed As New FeedKit.MutableFeed
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
		    Feed.Author = ParseAuthor(Dict.Value("author"))
		  End If
		  If Dict.HasKey("expired") Then
		    Feed.Expired = Dict.Value("expired")
		  End If
		  
		  Dim Items() As Auto = Dict.Value("items")
		  For Each Item As Xojo.Core.Dictionary In Items
		    Feed.Append(ParseEntry(Item))
		  Next
		  
		  Return New FeedKit.Feed(Feed)
		End Function
	#tag EndMethod


End Module
#tag EndModule
