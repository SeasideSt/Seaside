private
assertDispatched: aResponse
	self assert: registry cache size = registrySize.
	self assert: aResponse status = 200