tests
testDeleteDatabase
	self
		assertMethod: 'DELETE'
		selector: #deleteDatabase:
		path: #('credit_cards')
		arguments: #('credit_cards')