public
keyFromContext: aRequestContext
	"Answer the handler key extracted from aRequestContext.
	The key is used to look up the handler in the registry.
	
	Keys are used to track both sessions and request handlers so a key of a request handler should override the key of a session
	(eg. if you have a session cookie and a query field you have to answer the query field of the request handler)."
	self subclassResponsibility