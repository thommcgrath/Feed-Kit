# The ZAZ Feed Kit Version 1

[JSON Feed](https://jsonfeed.org/) is a fantastically simple syndication format. Feed Kit brings JSON Feed parsing to Xojo. Just add the module and call FeedKit.Parse to parse one.

## Requirements

Feed Kit utilizes the new Xojo Framework made available in 2015 Release 1. All projects can compile and use Feed Kit.

## Installation
Download the Feed Kit project, open the `Feed Kit.xojo_project` file, then copy the `FeedKit` module into your project.

## Getting Started

The first step is to obtain a JSON Feed, which is best done with [Xojo.Net.HTTPSocket](http://developer.xojo.com/xojo-net-httpsocket) and pass the result to FeedKit.Parse.

A [FeedKit.Feed](feed.md) object will be returned once ready.