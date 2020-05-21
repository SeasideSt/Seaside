private
startUp
	self isRunning
		ifFalse: [ server ifNotNil: [ server start ] ]