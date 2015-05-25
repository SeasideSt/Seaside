I am a message that can be sent if I match a request. Message arguments can be taken from the request.

Instance Variables:
	method		<String>
	selector	<Symbol>
	produces 	<WAMatch>
	consumes 	<WAMatch>
		
method
	- The HTTP method on which to follow this route, eg. 'GET'

selector
	- The selector to perform, eg. #index
	
produces
	- The MIME type this route produces (Content-Type HTTP header)
	
consumes
	- The MIME type this route accepts (Accept HTTP header)