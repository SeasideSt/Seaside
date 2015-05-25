tests
testCompactDatabase
	self
		assertMethod: 'POST'
		selector: #compactDatabase:
		path: #('credit_cards' '_compact')
		arguments: #('credit_cards')