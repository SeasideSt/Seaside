tests
testModifyingReplace
	self
		assert: (self element replace: 'foo')
		equals: '$(this).replace("foo")'.
	self
		assert: (self element replace: [ :r | r div id: 'foo' ])
		equals: '$(this).replace("<div id=\"foo\"><\/div>")'