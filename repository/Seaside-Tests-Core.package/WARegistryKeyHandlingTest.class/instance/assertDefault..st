private
assertDefault: aResponse
	self assert: registry cache size = registrySize.
	self assert: aResponse status = 404