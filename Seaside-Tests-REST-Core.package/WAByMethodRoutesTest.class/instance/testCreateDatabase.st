tests
testCreateDatabase
	self
		assertMethod: 'PUT'
		selector: #createDatabase:
		path: #('credit_cards')
		arguments: #('credit_cards')