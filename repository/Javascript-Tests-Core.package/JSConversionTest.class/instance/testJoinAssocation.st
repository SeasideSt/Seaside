tests
testJoinAssocation
	self
		assert: (JSJoin on: (OrderedCollection with: 'foo' -> nil)) 
		equals: '"foo"'.
	self
		assert: (JSJoin on: (OrderedCollection with: 'foo' -> true)) 
		equals: '"foo="+encodeURIComponent(true)'.
	self
		assert: (JSJoin on: (OrderedCollection with: 'foo' -> 123)) 
		equals: '"foo="+encodeURIComponent(123)'