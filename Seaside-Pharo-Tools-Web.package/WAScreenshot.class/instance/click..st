actions
click: aPoint
	| event |
	event := Array new: 8.
	event at: 1 put: 1.
	event at: 2 put: Time millisecondClockValue.
	event at: 3 put: aPoint x.
	event at: 4 put: aPoint y.
	event at: 5 put: self buttonCode.
	event at: 6 put: 0.
	self handleEvent: event.
	event at: 5 put: 0.
	self handleEvent: event.
	button := #red