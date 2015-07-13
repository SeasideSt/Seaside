testing
testMultipleMappings
	cache at: 'key1' put: 'value'.
	self should: [ cache at: 'key2' put: 'value' ] raise: Error