tests-modifying
testRemove
	self 
		assert: (((self jQuery: 'div')) remove)
		equals: self function , '("div").remove()'.
	self 
		assert: (((self jQuery: 'div')) remove: 'p')
		equals: self function , '("div").remove("p")'