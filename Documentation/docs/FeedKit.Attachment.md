# FeedKit.Attachment

The FeedKit.Attachment class provides information about files that belong to an entry, such as images or downloads.

## Constructors


## Properties

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">Duration <span style="color: #0000FF;">As</span> UInteger</span></pre>
Duration, in seconds, of the attachment. May be 0 if not supplied or not relevant for the attachment type.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">Length <span style="color: #0000FF;">As</span> UInteger</span></pre>
The size, in bytes, of the attachment. May be 0 if not supplied.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">MimeType <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
The MIME type, such as image/png, of the attachment.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">Title <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
The title or filename of the attachment.

<pre><span style="font-family: 'source-code-pro', 'menlo', 'courier', monospace; color: #000000;">URL <span style="color: #0000FF;">As</span> <span style="color: #0000FF;">Text</span></span></pre>
The URL where the attachment content can be loaded.
