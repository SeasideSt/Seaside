updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	"Deprecated for jQuery 4 usage: Google Hosted Libraries does not yet host jQuery 4.
	 Prefer JQJQueryCdnLibrary or JQCloudflareLibrary; this class is kept as a compatibility alias and uses the jQuery CDN URL below.
	 If Google starts hosting jQuery 4, direct Google hosting can be reinstated here."
	anHtmlRoot javascript
		url: 'https://code.jquery.com/jquery-4.0.0.min.js'