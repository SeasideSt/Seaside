testing
assertNotExisiting: aResponse
	self assert: aResponse status = 404.
	self assert: aResponse contentType main = 'text'.
	self assert: aResponse contentType sub = 'plain'