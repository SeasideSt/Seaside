handling
handleDefault: aRequestContext 
	"This method is called whenever a request is received with no key specified. This method can be overridden by subclasses to register a new handler to handle the request."
	
	aRequestContext responseGenerator
		notFound;
		respond