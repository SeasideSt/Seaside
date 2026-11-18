tests-events
testEventsKeyboard
	self
		assert: ((self jQuery: 'a') onKeyDown: self mock)
		equals: self function , '("a").on("keydown",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onKeyPress: self mock)
		equals: self function , '("a").on("keypress",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onKeyUp: self mock)
		equals: self function , '("a").on("keyup",function(){mock})'