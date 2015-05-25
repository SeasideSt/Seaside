tests
testCreateBulkDocumentsInDatabase
	self
		assertMethod: 'POST'
		selector: #createBulkDocumentsInDatabase:
		path: #('credit_cards' '_bulk_docs')
		arguments: #('credit_cards')