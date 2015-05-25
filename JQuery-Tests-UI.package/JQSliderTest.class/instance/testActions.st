tests
testActions
	self
		assert: ((self jQuery: 'span') slider setValue: 1)
		equals: self function , '("span").slider("value",1)'.
	self
		assert: ((self jQuery: 'span') slider setValue: 2 at: 3)
		equals: self function , '("span").slider("values",2,3)'.
	self
		assert: ((self jQuery: 'span') slider getValue)
		equals: self function , '("span").slider("value")'.
	self
		assert: ((self jQuery: 'span') slider getValueAt: 4)
		equals: self function , '("span").slider("values",4)'