tests-creation
testReady
	self
		assert: (self jQuery ready: (self javascript alert: 'Hello'))
		equals: self function , '(function(){alert("Hello")})'