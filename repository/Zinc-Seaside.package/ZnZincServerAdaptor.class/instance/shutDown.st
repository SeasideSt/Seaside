private
shutDown
	self isRunning
		ifTrue: [ server stop ]