tests-convenience
testAddStyle
	self
		assert: [ :attr | attr addStyle: 'display: hidden' ]
		gives: ' style="display: hidden"'.
	self
		assert: [ :attr | attr addStyle: 'display: hidden'; addStyle: 'position: absolute' ]
		gives: ' style="display: hidden;position: absolute"'