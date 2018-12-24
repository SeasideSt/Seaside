initialization
initializeFrom: aSourceContext to: aTargetContext
	self initialize.
	values := self captureFrom: aSourceContext to: aTargetContext