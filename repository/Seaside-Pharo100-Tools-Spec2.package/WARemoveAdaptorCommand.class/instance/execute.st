hooks
execute
	self adaptor isStopped ifTrue: [ self adaptor unregister ].
	self context updateAdaptorsTable