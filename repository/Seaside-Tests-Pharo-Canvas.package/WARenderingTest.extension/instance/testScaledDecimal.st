*seaside-tests-pharo-canvas
testScaledDecimal
	self
		assert: [ :canvas | canvas render: 123.4s1 ]
		gives: '123.4'