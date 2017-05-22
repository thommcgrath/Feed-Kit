# FeedKit.JSON

This class implements [FeedKit.Engine](FeedKit.Engine.md) to provide parsing an generation of [JSON](https://jsonfeed.org/version/1) feeds.

## Events

### Generators

Each of these generator events provide an opportunity for subclasses to inject additional keys into the output JSON.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> GenerateAttachment(Attachment <span style="color: #0000FF;">As</span> FeedKit.Attachment, Destination <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> GenerateAuthor(Author <span style="color: #0000FF;">As</span> FeedKit.Author, Destination <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> GenerateEntry(Entry <span style="color: #0000FF;">As</span> FeedKit.Entry, Destination <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> GenerateFeed(Feed <span style="color: #0000FF;">As</span> FeedKit.Feed, Destination <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary)</span></pre>

### Parsers

Each of these parser events provide an opportunity to grab additional keys from the parsed JSON.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> ParseAttachment(Source <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Attachment <span style="color: #0000FF;">As</span> FeedKit.MutableAttachment)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> ParseAuthor(Source <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Author <span style="color: #0000FF;">As</span> FeedKit.MutableAuthor)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> ParseEntry(Source <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Entry <span style="color: #0000FF;">As</span> FeedKit.MutableEntry)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Event</span> ParseFeed(Source <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Feed <span style="color: #0000FF;">As</span> FeedKit.MutableFeed)</span></pre>

## Methods

### AddIfNotEmpty

These AddIfNotEmpty methods will add the `Value` to `Dict` under `Key` only if `Value` is not empty, nil, or false.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Boolean</span>)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value <span style="color: #0000FF;">As</span> FeedKit.Attachment)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value <span style="color: #0000FF;">As</span> FeedKit.Author)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span>)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value <span style="color: #0000FF;">As</span> Xojo.Core.Date)</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Sub</span> AddIfNotEmpty(Dict <span style="color: #0000FF;">As</span> Xojo.Core.Dictionary, Key <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Value() <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, Separator <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>)</span></pre>

## Example

This subclass will support a property "_test" in a JSON feed.

TBD