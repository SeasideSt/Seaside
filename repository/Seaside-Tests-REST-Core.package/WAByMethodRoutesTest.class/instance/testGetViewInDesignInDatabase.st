tests
testGetViewInDesignInDatabase
	self
		assertMethod: 'GET'
		selector: #getView:inDesign:inDatabase:
		path: #('credit_cards' '_design' 'fraud' '_view' 'recent')
		arguments: #('recent' 'fraud' 'credit_cards')