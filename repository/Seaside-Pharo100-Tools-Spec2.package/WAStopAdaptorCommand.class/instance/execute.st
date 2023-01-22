hooks
execute
	self adaptor ifNotNil: [ :adaptor | adaptor stop ].
	self context updateAdaptorsTable