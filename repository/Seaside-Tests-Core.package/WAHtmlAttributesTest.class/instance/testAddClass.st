tests-convenience
testAddClass
	self
		assert: [ :attr | attr addClass: 'foo' ]
		gives: ' class="foo"'.
	self
		assert: [ :attr | attr addClass: 'foo'; addClass: 'bar' ]
		gives: ' class="foo bar"'