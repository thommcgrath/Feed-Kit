# FeedKit.Feed

FeedKit.Feed can be treated like an array of [FeedKit.Entry](FeedKit.Entry.md) instances.

## Constructors

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Constructor()</span></pre>
Creates a new empty feed.

## Properties

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">Author <span style="color: #0000FF;">As</span> FeedKit.Author</span></pre>
Author, if available, of the feed.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">Count <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span> <span style="color: #800000;">// Read Only</span></span></pre>
The number of entries.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">Description <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
Plain text explanation of the feed contents.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">Expired <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Boolean</span></span></pre>
If a feed is expired, it is not expected to be updated any more.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">FavIconURL <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
URL to a small icon to show with the feed.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">FeedURL <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
Full URL to the feed source.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">IconURL <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
Similar to the favicon, this is a url to a larger icon for the feed. 512px or larger icons are recommended for high-density screens.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">NextURL <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
URL to another feed file that contains the next page of entries.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">SiteURL <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
URL to the website which is represented by the feed.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">Title <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
Title of the feed.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">UserComment <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
Plain text developer comments about the feed.

## Methods

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Append(Entry <span style="color: #0000FF;">As</span> FeedKit.Entry)</span></pre>
Adds the entry if the entry does not already belong to the feed.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Function</span> Entry(Index <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span>) <span style="color: #0000FF;">As</span> FeedKit.Entry</span></pre>
<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Entry(Index <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span>, <span style="color: #0000FF;">Assigns</span> Value <span style="color: #0000FF;">As</span> FeedKit.Entry)</span></pre>
Gets or sets the entry at the supplied index. Throws an OutOfBoundsException if the index is invalid.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Function</span> IndexOf(Entry <span style="color: #0000FF;">As</span> FeedKit.Entry) <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span></span></pre>
Returns in the index of the supplied entry, or -1 if not found.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Insert(Index <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span>, Entry <span style="color: #0000FF;">As</span> FeedKit.Entry)</span></pre>
Adds the entry to the supplied index if the entry does not already belong to the feed.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Remove(Entry <span style="color: #0000FF;">As</span> FeedKit.Entry)</span></pre>
Removes the entry from the feed if it exists.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Sub</span> Remove(Index <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span>)</span></pre>
Removes the entry at the supplied index. Throws an OutOfBoundsException if the index is not valid.

