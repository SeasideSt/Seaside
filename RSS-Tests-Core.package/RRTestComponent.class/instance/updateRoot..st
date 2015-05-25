updating
updateRoot: anRssRoot
	super updateRoot: anRssRoot.
	anRssRoot stylesheet beXsl
		url: 'http://www.seaside.st/feed.xsl'