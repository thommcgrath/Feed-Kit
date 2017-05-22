# FeedKit.Engine

This simple interface is used to describe a class that can parse and generate a feed.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Function</span> Generate(Feed <span style="color: #0000FF;">As</span> FeedKit.Feed) <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
For the given [FeedKit.Feed](FeedKit.Feed.md) object, generate output to be consumed by another feed reader.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Function</span> MIMEType() <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
The MIME type, such as `application/json`, of the content the engine is intended to work with.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Function</span> Parse(Content <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>) <span style="color: #0000FF;">As</span> FeedKit.Feed</span></pre>
The `Parse` function should convert the supplied text to a [FeedKit.Feed](FeedKit.Feed.md) object. If the text is not expected to be parseable, such as supplying XML to an engine that works with JSON, `nil` should be returned. If the text is expected to be parseable, but an error is encountered, a FeedKit.ParseError exception should be raised.