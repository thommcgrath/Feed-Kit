# The ZAZ Feed Kit Version 1

[JSON Feed](https://jsonfeed.org/) is a fantastically simple syndication format. Feed Kit brings JSON Feed parsing to Xojo. Just add the module and call FeedKit.Parse to parse one.

## Requirements

Feed Kit utilizes the new Xojo Framework made available in 2015 Release 1. All projects can compile and use Feed Kit.

## Installation
Download the Feed Kit project, open the `Feed Kit.xojo_project` file, then copy the `FeedKit` module into your project.

## Getting Started

The first step is to obtain a JSON Feed, which is best done with [Xojo.Net.HTTPSocket](http://developer.xojo.com/xojo-net-httpsocket) and pass the result to FeedKit.Parse.

A [FeedKit.Feed](FeedKit.Feed.md) object will be returned once ready. Nil will be returned if FeedKit does not have a built-in engine to parse the content. A FeedKit.ParseError exception will be fired if an engine was found, but an error was found in the feed content.

A [FeedKit.Feed](FeedKit.Feed.md) object contains 1 or more [FeedKit.Entry](FeedKit.Entry.md) objects. Each [FeedKit.Entry](FeedKit.Entry.md) may have any number of [FeedKit.Attachment](FeedKit.Attachment.md) objects. Both [FeedKit.Feed](FeedKit.Feed.md) and [FeedKit.Entry](FeedKit.Entry.md) can be used like an array.

Each of the following syntaxes are legal:

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;"><span style="color: #0000FF;">Dim</span> Feed <span style="color: #0000FF;">As</span> FeedKit.Feed = FeedKit.Parse(Content)

<span style="color: #0000FF;">For</span> <span style="color: #0000FF;">Each</span> Entry <span style="color: #0000FF;">As</span> FeedKit.Entry <span style="color: #0000FF;">In</span> Feed
<span style="color: #0000FF;">Next</span>

<span style="color: #0000FF;">For</span> I <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span> = <span style="color: #336698;">0</span> <span style="color: #0000FF;">To</span> UBound(Feed)
  <span style="color: #0000FF;">Dim</span> Entry <span style="color: #0000FF;">As</span> FeedKit.Entry = Feed(I)
<span style="color: #0000FF;">Next</span>

<span style="color: #0000FF;">For</span> I <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Integer</span> = <span style="color: #336698;">0</span> <span style="color: #0000FF;">To</span> Feed.Count - <span style="color: #336698;">1</span>
  <span style="color: #0000FF;">Dim</span> Entry <span style="color: #0000FF;">As</span> FeedKit.Entry = Feed.Entry(I)
<span style="color: #0000FF;">Next</span></span></pre>