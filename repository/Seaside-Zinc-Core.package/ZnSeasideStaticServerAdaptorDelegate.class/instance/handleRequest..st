public
handleRequest: znRequest
	"If the Seaside request processing apparatus returns an HTTP response with a 'not found' error for a GET request,
	check the filesystem for a file that matches the uri of the request, if found send the file if not send the original error."

	| response staticResponse |
	response := self adaptor process: znRequest.
	^ (response isNotFound and: [ znRequest method = 'GET' and: [ response isAuthenticationRequired not ] ])
		ifTrue: [ 
			staticResponse := self staticDelegate handleRequest: znRequest.
			staticResponse isNotFound
				ifTrue: [ response ]
				ifFalse: [ staticResponse ] ]
		ifFalse: [ response ]