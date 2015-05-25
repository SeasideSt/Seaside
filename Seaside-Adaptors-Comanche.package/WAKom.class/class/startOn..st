compatibility
startOn: portInteger
	self default isNil
		ifFalse: [ self default stop; port: portInteger ]
		ifTrue: [
			default := self adaptorClass port: portInteger.
			default codec: self defaultCodec ].
	^ self start