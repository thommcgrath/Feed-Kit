# FeedKit.Entry

## Constructors

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Constructor(Source <span style="color: #0000FF;">As</span> FeedKit.Entry)</span></pre>
Creates a clone of the supplied entry.

## Properties

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">BannerURL <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
URL of an image that may optionally be shown behind the title of the entry.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">ContentHTML <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
HTML version of the content, if available.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">ContentPlain <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
Plain text version of the content, if available.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">Count <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span> <span style="color: #800000;">// Read Only</span></span></pre>
The number of attachments.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">DateModified <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Xojo.Core.Date</span></span></pre>
The date the entry was last modified. May be nil.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">DatePublished <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Xojo.Core.Date</span></span></pre>
The date the entry was published. May be nil.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">ExternalURL <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
A third-party URL which the entry references. Useful primarily for link blogs.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">ID <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
A feed-unique ID that should never change, even if the url changes.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">ImageURL <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
URL of a "hero" image for the entry.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">Summary <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
Short plain text summary of the entry.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">Title <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
The title or headline of the entry.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">URL <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
The full url of the entry.

## Methods

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Function</span> Attachment(Index <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span>) <span style="color: #0000FF;">As</span> FeedKit.Attachment</span></pre>
Returns the attachment at the supplied index. Will throw an OutOfBoundsException if the index is not valid.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Function</span> Author() <span style="color: #0000FF;">As</span> FeedKit.Author</span></pre>
Returns the author object of the entry, or nil if not supplied.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Function</span> IndexOf(Needle <span style="color: #0000FF;">As</span> FeedKit.Attachment) <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span></span></pre>
Returns in the index of the supplied attachment, or -1 if not found.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Function</span> Tags() <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>()</span></pre>
Returns an array of tags associated with the entry.

# FeedKit.MutableEntry

## Constructors

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Constructor()</span></pre>
Creates a new empty entry. Automatically assigns a v4 UUID to the ID property.

## Methods

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Append(Attachment <span style="color: #0000FF;">As</span> FeedKit.Attachment)</span></pre>
Adds the attachment if the attachment does not already belong to the entry.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Attachment(Index <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span>, <span style="color: #0000FF;">Assigns</span> Value <span style="color: #0000FF;">As</span> FeedKit.Attachment)</span></pre>
Updates the attachment at the supplied index. Throws an OutOfBoundsException if the index is not valid.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Author(<span style="color: #0000FF;">Assigns</span> Value <span style="color: #0000FF;">As</span> FeedKit.Author)</span></pre>
Sets the entry author.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Insert(Index <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span>, Attachment <span style="color: #0000FF;">As</span> FeedKit.Attachment)</span></pre>
Adds the attachment to the supplied index if the attachment does not already belong to the entry.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Remove(Attachment <span style="color: #0000FF;">As</span> FeedKit.Attachment)</span></pre>
Removes the attachment from the entry if it exists.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Remove(Index <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span>)</span></pre>
Removes the attachment at the supplied index. Throws an OutOfBoundsException if the index is not valid.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Tags(<span style="color: #0000FF;">Assigns</span> Value() <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>)</span></pre>
Sets the tags to the supplied array.