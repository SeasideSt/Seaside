updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	
	"Google Hosted Libraries does not offer jQuery 4 (yet).
	Use JQJQueryCdnLibrary or JQCloudflareLibrary for jQuery 4."
	anHtmlRoot javascript
		url: 'https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js'