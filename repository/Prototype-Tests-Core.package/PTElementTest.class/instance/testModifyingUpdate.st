tests
testModifyingUpdate
	self
		assert: (self element id: 'foo'; update: 'bar')
		equals: '$("foo").update("bar")'.
	self
		assert: (self element update: [ :r | r div: 'bar' ])
		equals: '$(this).update("<div>bar</div>")'