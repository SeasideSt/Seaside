tests-events
testTrigger
	self
		assert: ((self jQuery: 'a') trigger: 'click')
		equals: self function , '("a").trigger("click")'.
	self
		assert: ((self jQuery: 'a' ) triggerHandler: 'keypress')
		equals: self function , '("a").triggerHandler("keypress")'