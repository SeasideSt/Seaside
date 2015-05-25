tests-status
testCodes
	| names codes |
	names := #( authenticationFailed forbidden found gone internalError notFound notImplemented ).
	codes := #( 401 403 302 410 500 404 501 ).
	names with: codes do: [ :name :code | 
		self response perform: name.
		self assert: self response status = code.
		self assert: self response message = (self response class messageForStatus: code) ]