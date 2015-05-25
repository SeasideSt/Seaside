actions
internalError: anError 
	"This method should not call #handleException: because subclasses want to modify the behaviour for for other exceptions without changing the simple fallback internal error behaviour."
	
	self requestContext responseGenerator
		internalError: anError;
		respond