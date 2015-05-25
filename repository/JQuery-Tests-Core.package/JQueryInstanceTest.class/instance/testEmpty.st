tests-modifying
testEmpty
	self 
		assert: (((self jQuery: 'div')) empty)
		equals: self function , '("div").empty()'