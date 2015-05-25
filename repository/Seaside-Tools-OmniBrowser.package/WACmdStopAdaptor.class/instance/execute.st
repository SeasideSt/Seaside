execution
execute
	self isEnabled ifFalse: [ ^ nil ].
	target stop.
	requestor browser signalRefresh