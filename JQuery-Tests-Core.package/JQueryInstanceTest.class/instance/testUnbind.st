tests-events
testUnbind
	self
		assert: ((self jQuery: 'a') unbind: 'click')
		equals: self function , '("a").unbind("click")'