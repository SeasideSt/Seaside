processing
handleRequest: aRequestContext
	"Pass the request context to the appropriate request handler."
	
	[ self requestHandler handle: aRequestContext ]
		on: WAResponseNotification
		do: [ :n | "got a response" ]