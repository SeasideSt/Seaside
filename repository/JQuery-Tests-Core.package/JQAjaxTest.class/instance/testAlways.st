tests-events
testAlways
	self
		assert: (self jQuery ajax always: (self javascript alert: 'always'))
		equals: self function, '.ajax().always(function(){alert("always")})'