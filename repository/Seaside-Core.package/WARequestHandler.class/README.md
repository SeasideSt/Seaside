WARequestHandler is an abstract class whose subclasses handle http requests. Most of the methods are either empty or return a default value. 

Subclasses must implement the following messages:
	handleFiltered:	process the request

