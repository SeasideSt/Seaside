processing
handlePadding: aRequestContext
	"If you create an error page that's too small, Microsoft Internet Explorer will display its own error page that includes a link to the MSN network search engine rather than your own error page. See <http://www.404-error-page.com/404-error-page-too-short-problem-microsoft-ie.shtml> for details."

	| size |
	size := aRequestContext response stream size.
	^ (size < 512 and: [ #(400 403 404 405 406 408 409 410 500 501 505) includes: aRequestContext response status ])
		ifTrue: [ aRequestContext response nextPutAll: ((String new: 512 - size) atAllPut: $ ) ]