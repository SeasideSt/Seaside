tests-events
testEventsPointerAndWheel
	self
		assert: ((self jQuery: 'a') onPointerCancel: self mock)
		equals: self function , '("a").on("pointercancel",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onPointerDown: self mock)
		equals: self function , '("a").on("pointerdown",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onPointerEnter: self mock)
		equals: self function , '("a").on("pointerenter",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onPointerLeave: self mock)
		equals: self function , '("a").on("pointerleave",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onPointerMove: self mock)
		equals: self function , '("a").on("pointermove",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onPointerOut: self mock)
		equals: self function , '("a").on("pointerout",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onPointerOver: self mock)
		equals: self function , '("a").on("pointerover",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onPointerUp: self mock)
		equals: self function , '("a").on("pointerup",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onWheel: self mock)
		equals: self function , '("a").on("wheel",function(){mock})'