handling-helpers
dispatch: aRequestContext to: aRequestHandler key: aString
	"This method is used by the handling methods to trigger the dispatch of a request
	to the specified handler."
	
	self trackingStrategy addKey: aString toContext: aRequestContext.
	aRequestHandler handle: aRequestContext
