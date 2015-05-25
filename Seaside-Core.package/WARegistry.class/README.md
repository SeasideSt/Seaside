WARegistry maintains a set of handlers indexed by a key which it assigns when the handler is registerd. WARegistry checks incoming request URLs for a key and looks for a matching active request handler. If one exists, the request is sent to the proper handler. If not, the request is either a new request (in which case #handleDefaultRequest: is called) or a request to a now-inactive handler (in which case #handleExpiredRequest: is called). These two methods allow subclasses to properly handle these requests.

Subclasses must implement the following messages:
	handleDefaultRequest:
		Handle a request without a session key, ie a new request.
	handlerField
		The URL parameter in which to store the request handler key.

Instance Variables:
	cache - an instance of WACache to hold the stored request handlers
