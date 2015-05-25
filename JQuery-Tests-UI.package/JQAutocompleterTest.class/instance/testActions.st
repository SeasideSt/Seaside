tests
testActions
	self
		assert: ((self jQuery: 'input') autocomplete close)
		equals: self function , '("input").autocomplete("close")'.
	self
		assert: ((self jQuery: 'input') autocomplete search: 'something')
		equals: self function , '("input").autocomplete("search","something")'