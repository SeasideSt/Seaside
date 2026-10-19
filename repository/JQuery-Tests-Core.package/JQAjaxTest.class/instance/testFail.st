tests-events
testFail
	self
		assert: (self jQuery ajax fail: (self javascript alert: 'fail'))
		equals: self function, '.ajax().fail(function(){alert("fail")})'