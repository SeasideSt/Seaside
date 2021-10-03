rendering
renderTestingOn: html

	html paragraph:[
		html text: ('This test will make asynchronous requests to a request handler at <1p>.' 
			 expandMacrosWith: self corsFilter handler url).
		html text: 'We recommend opening the developer console and see the requests in the "Network tab".'.
		html html: 'For more information about CORS <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS" target="_blank">read this documentation at MDN</a>.' ].
	html horizontalRule.
	self renderCORSFilterOriginsOn: html.
	self renderCORSFilterMethodsOn: html.
	html horizontalRule.
	self renderTestsOn: html.
	html horizontalRule.
	self renderRequestResultIndicatorOn: html.
