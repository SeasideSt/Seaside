tests
testGetConfig
	self
		assertMethod: 'GET'
		selector: #getConfig
		path: #('_config')
		arguments: #()