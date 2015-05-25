testing
testHandleFileRequest
	| response |
	self requestContextWithUrl: '/root/files/WATestingFiles/sample.js'.
	self requestContext consumer next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assert: response status = 200.
	self assert: response contentType main = 'application'.
	self assert: response contentType sub = 'x-javascript'.
	self assert: response contents = WATestingFiles new sampleJs