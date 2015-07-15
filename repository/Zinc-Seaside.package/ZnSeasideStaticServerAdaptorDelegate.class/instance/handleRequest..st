public
handleRequest: znRequest
	"If the Seaside request processing apparatus returns an HTTP response with an error 
	check the filesystem for a file that matches the uri of the request, if found send the file if not send an error."

	| response |
	response := self adaptor process: znRequest.
	^ (response isError and: [ response isAuthenticationRequired not ])
			ifTrue: [ self staticDelegate handleRequest: znRequest ]
			ifFalse: [ response ].