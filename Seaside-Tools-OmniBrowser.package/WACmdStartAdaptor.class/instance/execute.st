execution
execute
	self isEnabled ifFalse: [ ^ nil ].
	target start.
	requestor browser signalRefresh