tests
testGetDocumentOfDatabase
	self
		assertMethod: 'GET'
		selector: #getDocument:ofDatabase:
		path: #('credit_cards' '1111-2222-3333-4444')
		arguments: #('1111-2222-3333-4444' 'credit_cards')