tests
testJoinString
	self
		assert: (JSJoin on: (OrderedCollection with: 'foo' -> 'bar')) 
		equals: '"foo=bar"'.
	self
		assert: (JSJoin on: (OrderedCollection with: 'foo' -> 'bar zork')) 
		equals: '"foo=bar%20zork"'.
	self
		assert: (JSJoin on: (OrderedCollection with: 'foo' -> 'bar&zork')) 
		equals: '"foo=bar%26zork"'