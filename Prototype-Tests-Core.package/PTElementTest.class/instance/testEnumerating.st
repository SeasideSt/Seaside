tests
testEnumerating
	self
		assertEnumerable: [ self element ancestors ]
		prefix: '$(this).ancestors()'.
	self
		assertEnumerable: [ self element childElements ]
		prefix: '$(this).childElements()'.
	self
		assertEnumerable: [ self element descendants ]
		prefix: '$(this).descendants()'.
	self
		assertEnumerable: [ self element nextSiblings ]
		prefix: '$(this).nextSiblings()'.
	self
		assertEnumerable: [ self element previousSiblings ]
		prefix: '$(this).previousSiblings()'.
	self
		assertEnumerable: [ self element select: 'div.foo' ]
		prefix: '$(this).select("div.foo")'.
	self
		assertEnumerable: [ self element siblings ]
		prefix: '$(this).siblings()'