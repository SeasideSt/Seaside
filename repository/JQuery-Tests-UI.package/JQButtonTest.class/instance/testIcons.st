tests
testIcons
	self
		assert: ((self jQuery: 'input') button primaryIcon: 'foo')
		equals: self function , '("input").button({"icons":{"primary":"foo"}})'.
	self
		assert: ((self jQuery: 'input') button primaryIcon: 'foo'; secondaryIcon: 'bar')
		equals: self function , '("input").button({"icons":{"primary":"foo","secondary":"bar"}})'