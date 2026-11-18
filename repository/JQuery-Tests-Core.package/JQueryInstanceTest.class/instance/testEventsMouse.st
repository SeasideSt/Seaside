tests-events
testEventsMouse
	self
		assert: ((self jQuery: 'a') onClick: self mock)
		equals: self function , '("a").on("click",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onDoubleClick: self mock)
		equals: self function , '("a").on("dblclick",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseDown: self mock)
		equals: self function , '("a").on("mousedown",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseEnter: self mock)
		equals: self function , '("a").on("mouseenter",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseLeave: self mock)
		equals: self function , '("a").on("mouseleave",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseMove: self mock)
		equals: self function , '("a").on("mousemove",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseOut: self mock)
		equals: self function , '("a").on("mouseout",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseOver: self mock)
		equals: self function , '("a").on("mouseover",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseUp: self mock)
		equals: self function , '("a").on("mouseup",function(){mock})'