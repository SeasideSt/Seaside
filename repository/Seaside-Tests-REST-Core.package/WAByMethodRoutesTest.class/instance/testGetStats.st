tests
testGetStats
	self
		assertMethod: 'GET'
		selector: #getStats
		path: #('_stats')
		arguments: #()