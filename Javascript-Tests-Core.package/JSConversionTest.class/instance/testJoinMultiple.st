tests
testJoinMultiple
	self
		assert: (JSJoin on: #('foo')) 
		equals: '"foo"'.
	self
		assert: (JSJoin on: #('foo' 'bar'))
		equals: '["foo","bar"].join("&")'