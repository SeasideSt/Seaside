tests
testGetDatabase
	self
		assertMethod: 'GET'
		selector: #getDatabase:
		path: #('credit_cards')
		arguments: #('credit_cards')