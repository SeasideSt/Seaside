tests-chaining
testAddBack
	self
		assert: ((self jQuery: 'div') find: 'p'; addBack; addClass: 'border')
		equals: self function , '("div").find("p").addBack().addClass("border")'