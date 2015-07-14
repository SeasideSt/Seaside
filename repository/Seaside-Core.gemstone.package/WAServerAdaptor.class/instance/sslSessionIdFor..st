converting-request
sslSessionIdFor: aNativeRequest
	"Answer the SSL session id or nil if the request wasn't made over SSL or the server adaptor does not support it.
	
	The default implementation answers nil for compatibility and convenience reasons."
	^ nil