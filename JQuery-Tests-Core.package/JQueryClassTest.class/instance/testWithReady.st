tests-with
testWithReady
	self
		assert: (self jQuery: (self javascript alert: 'Hello'))
		equals: self function , '(function(){alert("Hello")})'