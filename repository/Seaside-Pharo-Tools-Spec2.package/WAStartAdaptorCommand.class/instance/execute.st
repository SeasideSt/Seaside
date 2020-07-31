hooks
execute
	self adaptor ifNotNil: [ :adaptor | adaptor start ].
	self context updateAdaptorsTable