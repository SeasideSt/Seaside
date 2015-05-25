tests
testCreateNewDocumentInDatabase
	self
		assertMethod: 'POST'
		selector: #createNewDocumentInDatabase:
		path: #('credit_cards')
		arguments: #('credit_cards')