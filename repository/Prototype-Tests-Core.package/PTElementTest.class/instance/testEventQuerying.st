tests-events
testEventQuerying
	self
		assert: (self event element)
		equals: 'Event.element(event)'.
	self
		assert: (self event event: 'bar'; x)
		equals: 'Event.pointerX("bar")'.
	self
		assert: self event y
		equals: 'Event.pointerY(event)'