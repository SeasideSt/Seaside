tests
testEvents
	self
		assert: ((self jQuery: 'div') draggable onDrag: 1)
		equals: self function , '("div").draggable({"drag":function(){1}})'.
	self
		assert: ((self jQuery: 'div') draggable onStart: 2)
		equals: self function , '("div").draggable({"start":function(){2}})'.
	self
		assert: ((self jQuery: 'div') draggable onStop: 3)
		equals: self function , '("div").draggable({"stop":function(){3}})'