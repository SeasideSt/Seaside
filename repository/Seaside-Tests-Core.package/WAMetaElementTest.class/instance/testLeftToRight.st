tests
testLeftToRight
	self
		assert: [ :root | root meta beLeftToRight ]
		gives: '<meta dir="LTR" content=""/>'