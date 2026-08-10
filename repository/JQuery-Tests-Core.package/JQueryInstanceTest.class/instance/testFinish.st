tests-effects
testFinish
	self
		assert: ((self jQuery: 'div') finish)
		equals: self function , '("div").finish()'