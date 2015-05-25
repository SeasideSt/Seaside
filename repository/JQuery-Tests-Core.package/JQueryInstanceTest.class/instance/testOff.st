tests-events
testOff
	self
		assert: ((self jQuery: 'a') off: 'click')
		equals: self function , '("a").off("click")'.
	self
		assert: ((self jQuery: 'a') off: 'click' selector: 'div')
		equals: self function , '("a").off("click","div")'