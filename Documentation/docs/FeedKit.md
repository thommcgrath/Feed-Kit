# FeedKit Module

The FeedKit module provides a few convenience methods to help get started quicker.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Function</span> JSON() <span style="color: #0000FF;">As</span> FeedKit.JSON</span></pre>
Returns a static instance of the built-in JSON parser and generator.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Function</span> RSS() <span style="color: #0000FF;">As</span> FeedKit.RSS</span></pre>
*Not available on iOS*. Returns a static instance of the built-in RSS parser and generator.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Function</span> ToISO8601(<span style="color: #0000FF;">Extends</span> Date <span style="color: #0000FF;">As</span> Xojo.Core.Date) <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
This extension method for Xojo.Core.Date returns the date in ISO 8601 format.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Function</span> DateFromISO8601(Source <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>) <span style="color: #0000FF;">As</span> Xojo.Core.Date</span></pre>
Returns a new Xojo.Core.Date object for the supplied ISO 8601 date.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Public</span> <span style="color: #0000FF;">Function</span> ToRFC822(<span style="color: #0000FF;">Extends</span> Date <span style="color: #0000FF;">As</span> Xojo.Core.Date) <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
This extension method for Xojo.Core.Date returns the date in RFC 822 format.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Function</span> DateFromRFC822(Source <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>) <span style="color: #0000FF;">As</span> Xojo.Core.Date</span></pre>
Returns a new Xojo.Core.Date object for the supplied RFC 822 date.

## The `Parse` Function

If the feed type is known before parsing, use the `Parse` function of the correct engine.

`FeedKit.Parse`'s first parameter takes either a `Text`, Classic `MemoryBlock`, or `Xojo.Core.MemoryBlock`. The second parameter is an optional array of [FeedKit.Engine](FeedKit.Engine.md) implementing classes. These engines will be tried in order. The built-in engines will be tried after the supplied engines. In lieu of an array, one or more engines may be specified in the second (and beyond) parameter.

This means are many ways to call `FeedKit.Parse`. This is the complete list of signatures.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Function</span> Parse(Content <span style="color: #0000FF;">As</span> Global.MemoryBlock, AdditionalEngines() <span style="color: #0000FF;">As</span> FeedKit.Engine) <span style="color: #0000FF;">As</span> FeedKit.Feed</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Function</span> Parse(Content <span style="color: #0000FF;">As</span> Global.MemoryBlock, <span style="color: #0000FF;">ParamArray</span> AdditionalEngines() <span style="color: #0000FF;">As</span> FeedKit.Engine) <span style="color: #0000FF;">As</span> FeedKit.Feed</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Function</span> Parse(Content <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, AdditionalEngines() <span style="color: #0000FF;">As</span> FeedKit.Engine) <span style="color: #0000FF;">As</span> FeedKit.Feed</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Function</span> Parse(Content <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span>, <span style="color: #0000FF;">ParamArray</span> AdditionalEngines() <span style="color: #0000FF;">As</span> FeedKit.Engine) <span style="color: #0000FF;">As</span> FeedKit.Feed</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Function</span> Parse(Content <span style="color: #0000FF;">As</span> Xojo.Core.MemoryBlock, AdditionalEngines() <span style="color: #0000FF;">As</span> FeedKit.Engine) <span style="color: #0000FF;">As</span> FeedKit.Feed</span></pre>

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Protected</span> <span style="color: #0000FF;">Function</span> Parse(Content <span style="color: #0000FF;">As</span> Xojo.Core.MemoryBlock, <span style="color: #0000FF;">ParamArray</span> AdditionalEngines() <span style="color: #0000FF;">As</span> FeedKit.Engine) <span style="color: #0000FF;">As</span> FeedKit.Feed</span></pre>

Just like with `FeedKit.Parse`, the `Parse` method of a [FeedKit.Engine](FeedKit.Engine.md) implementor may be called with `Text`, Classic `MemoryBlock` or `Xojo.Core.MemoryBlock`.