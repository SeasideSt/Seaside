handling
handleFiltered: aRequestContext
	self addRedirectedToHeader: aRequestContext.
	self respond: [ :response | self processRendering: response ].

	"The render phase should have returned a response"
	WAMissingResponseError signal