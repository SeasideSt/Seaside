tests-utilities
testGlobalEval
	self
		assert: (self jQuery globalEval: 'alert(1)')
		equals: self function , '.globalEval("alert(1)")'