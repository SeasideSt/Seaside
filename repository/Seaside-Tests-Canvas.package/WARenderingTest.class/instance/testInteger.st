tests
testInteger
	self
		assert: [ :canvas | canvas render: 123 ]
		gives: '123'.
	self
		assert: [ :canvas | canvas render: -123 ]
		gives: '-123'