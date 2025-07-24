I am a message that can be sent if I match a request. Message arguments can be taken from the request.

Instance Variables:
	method		<String>: The HTTP method on which to follow this route, eg. 'GET'
	selector	<Symbol>: The selector to perform, eg. #index
	produces 	<WAMatch>: The MIME type this route produces (Content-Type HTTP header)
	consumes 	<WAMatch>: The MIME type this route accepts (Accept HTTP header)