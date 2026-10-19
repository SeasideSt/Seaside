tests-events
testDone
	self
		assert: (self jQuery ajax done: (self javascript alert: 'done'))
		equals: self function, '.ajax().done(function(){alert("done")})'