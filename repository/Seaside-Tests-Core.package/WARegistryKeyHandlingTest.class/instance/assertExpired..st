private
assertExpired: aResponse
	self assert: registry cache size = registrySize.
	self assert: aResponse status = 302.
	self assert: (aResponse headers at: 'Location') = self path