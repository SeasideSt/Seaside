public
addKey: aString toContext: aRequestContext
	"Add the key of the handler to the request context. This is mostly used for adding a cookie to the response."
	self subclassResponsibility