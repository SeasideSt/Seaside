testing
assertListing: aResponse
	self assert: aResponse status = 403.
	self assert: aResponse contentType main = 'text'.
	self assert: aResponse contentType sub = 'plain'