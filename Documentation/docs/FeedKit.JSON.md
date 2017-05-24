# FeedKit.JSON

`FeedKit.JSON` is both a class and a method. The following is valid code:

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Dim</span> Engine <span style="color: #0000FF;">As</span> FeedKit.JSON = FeedKit.JSON</span></pre>

## Events

### Creators

Each of these methods are called just before a new instance is needed. The purpose of these events is to allow subclasses to create custom instances and parse additional data.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> CreateAttachment(Source <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary) <span style="color: #0000FF;">As</span> FeedKit.Attachment</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> CreateAuthor(Source <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary) <span style="color: #0000FF;">As</span> FeedKit.Author</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> CreateEntry(Source <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary) <span style="color: #0000FF;">As</span> FeedKit.Entry</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> CreateFeed(Source <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary) <span style="color: #0000FF;">As</span> FeedKit.Feed</span></pre>

### Encoders

These methods are called after the object has been turned into a dictionary. The purpose is to allow subclasses to inject additional keys into the structure.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> EncodeAttachment(Attachment <span style="color: #0000FF;">As</span> FeedKit.Attachment, Data <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> EncodeAuthor(Author <span style="color: #0000FF;">As</span> FeedKit.Author, Data <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> EncodeEntry(Entry <span style="color: #0000FF;">As</span> FeedKit.Entry, Data <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> EncodeFeed(Feed <span style="color: #0000FF;">As</span> FeedKit.Feed, Data <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary)</span></pre>

## Methods

### AddIfNotEmpty

There are a number of AddIfNotEmpty protected methods that will add a key+value pair to the dictionary only if the value is not empty, nil, false, or 0.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Boolean</span>)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value <span style="color: #0000FF;">As</span> FeedKit.Attachment)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value <span style="color: #0000FF;">As</span> FeedKit.Author)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span>)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value <span style="color: #0000FF;">As</span> Xojo.Core.Date)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value() <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Separator <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>)</span></pre>