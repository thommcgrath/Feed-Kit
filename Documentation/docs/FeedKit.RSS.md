# FeedKit.RSS

*This class is not available to iOS projects.*

`FeedKit.RSS` is both a class and a method. The following is valid code:

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Dim</span> Engine <span style="color: #0000FF;">As</span> FeedKit.RSS = FeedKit.RSS</span></pre>

## Events

### Creators

Each of these methods are called just before a new instance is needed. The purpose of these events is to allow subclasses to create custom instances and parse additional data.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> CreateAttachment(Element <span style="color: #0000FF;">As</span> XMLNode) <span style="color: #0000FF;">As</span> FeedKit.Attachment</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> CreateAuthor(Element <span style="color: #0000FF;">As</span> XMLNode) <span style="color: #0000FF;">As</span> FeedKit.Author</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> CreateEntry(Element <span style="color: #0000FF;">As</span> XMLNode) <span style="color: #0000FF;">As</span> FeedKit.Entry</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> CreateFeed(Element <span style="color: #0000FF;">As</span> XMLNode) <span style="color: #0000FF;">As</span> FeedKit.Feed</span></pre>

### Encoders

These methods are called after the object has been turned into XML. The purpose is to allow subclasses to inject additional XML into the structure.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> EncodeAttachment(Attachment <span style="color: #0000FF;">As</span> FeedKit.Attachment, Element <span style="color: #0000FF;">As</span> XMLNode)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> EncodeAuthor(Author <span style="color: #0000FF;">As</span> FeedKit.Author, Element <span style="color: #0000FF;">As</span> XMLNode)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> EncodeEntry(Entry <span style="color: #0000FF;">As</span> FeedKit.Entry, Element <span style="color: #0000FF;">As</span> XMLNode)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> EncodeFeed(Feed <span style="color: #0000FF;">As</span> FeedKit.Feed, Element <span style="color: #0000FF;">As</span> XMLNode)</span></pre>

## Methods

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Function</span> Search(Element <span style="color: #0000FF;">As</span> XMLNode, Tag <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">String</span>) <span style="color: #0000FF;">As</span> XMLNode</span></pre>
Searches `Element` for the first node named `Tag`. This method is not very efficient, so it should only be used to find one or two tags. For finding a large number of tags, loop over the children of `Element` and grab the desired children.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Function</span> TextValue(Element <span style="color: #0000FF;">As</span> XMLNode) <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
Gets the text inside `Element`. Will return an empty string if `Element` is `Nil`, has no children, or its first child is not an `XMLTextNode`.

### Append

The `Append` method variants make it easier to add nodes to the XML structure. The `OmitEmpty` parameter, where available, will not add values that empty, nil, false, or 0.

Rather than calling

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Dim</span> Child <span style="color: #0000FF;">As</span> XMLNode = Parent.AppendChild(Document.CreateElement(<span style="color: #6600FE;">&quot;element&quot;</span>))
Child.AppendChild(Document.CreateTextNode(<span style="color: #6600FE;">&quot;value&quot;</span>))</span></pre>

The `Append` method can do that in a single line

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">Append(Document, Parent, <span style="color: #6600FE;">&quot;element&quot;</span>, <span style="color: #6600FE;">&quot;value&quot;</span>)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> Append(Document <span style="color: #0000FF;">As</span> XMLDocument, Parent <span style="color: #0000FF;">As</span> XMLNode, Name <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">String</span>, Value <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span>, OmitEmpty <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Boolean</span> = <span style="color: #0000FF;">True</span>)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> Append(Document <span style="color: #0000FF;">As</span> XMLDocument, Parent <span style="color: #0000FF;">As</span> XMLNode, Name <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">String</span>, Value <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">String</span>, OmitEmpty <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Boolean</span> = <span style="color: #0000FF;">True</span>)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> Append(Document <span style="color: #0000FF;">As</span> XMLDocument, Parent <span style="color: #0000FF;">As</span> XMLNode, Name <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">String</span>, Value <span style="color: #0000FF;">As</span> Xojo.Core.Date, OmitEmpty <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Boolean</span> = <span style="color: #0000FF;">True</span>)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> Append(Document <span style="color: #0000FF;">As</span> XMLDocument, Parent <span style="color: #0000FF;">As</span> XMLNode, Value <span style="color: #0000FF;">As</span> FeedKit.Attachment)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> Append(Document <span style="color: #0000FF;">As</span> XMLDocument, Parent <span style="color: #0000FF;">As</span> XMLNode, Value <span style="color: #0000FF;">As</span> FeedKit.Entry)</span></pre>