---
title: This Post exemplifies some markdown stuff
layout: post
authors:
- vc
visible: true
tags:
- example
image: martin-adams-pTCcJSBOTxY-unsplash.jpg
---

I wrote it today.

# This is an H1

a divider:

---

^ that was a divider.

## Headings

stuff

### More headings

**bold** *italic* **_bold italic_** _**italic bold**_ `inline code`.

```js
// ``` code block
var = "wut"
```

{% highlight js %}
// highlight code block
var = "wut"
{% endhighlight %}

```sire
// ``` code block
@ thing | barNat 10
```

> quote quote
>
> quote

#### Some custom stuff:

This is our <span class="key-term">Key Term</span> style.

These are our horizontal bars (css class), which works on html-in-markdown, but you can just use a `<hr>` tag or `---` in markdown, which does the same.

<div class="horizontal-bars"></div>


An image:

![]({{ 'vaporware.png' | relative_url }})
