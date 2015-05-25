processing
addRedirectedToHeader: aRequestContext
	"The Ajaxifier needs to know the URL of the render continuation (in order to save it).
	Unfortunately the redirect from the action to the render continuation happens totally transparently to the JavaScript.
	So we add a custom header to the response so that the JavaScript can find out the URL of the render continuation."
	 (aRequestContext request headerAt: 'x-requested-with') = 'Ajaxifier' ifTrue: [
		aRequestContext response headerAt: 'X-RedirectedTo' put: aRequestContext request url greaseString ]