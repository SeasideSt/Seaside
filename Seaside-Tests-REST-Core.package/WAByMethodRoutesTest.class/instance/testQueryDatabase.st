tests
testQueryDatabase
	self
		assertMethod: 'POST'
		selector: #queryDatabase:
		path: #('credit_cards' '_temp_view')
		arguments: #('credit_cards')