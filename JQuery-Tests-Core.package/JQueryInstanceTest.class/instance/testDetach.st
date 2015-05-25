tests-modifying
testDetach
	self
		assert: ((self jQuery: 'p') detach)
		equals: self function , '("p").detach()'.
	self
		assert: ((self jQuery: 'p') detach: '#foo')
		equals: self function , '("p").detach("#foo")'