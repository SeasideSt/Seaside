tests-attributes
testRemoveAttribute
	self
		assert: ((self jQuery: 'button') removeAttribute: 'disabled')
		equals: self function , '("button").removeAttr("disabled")'