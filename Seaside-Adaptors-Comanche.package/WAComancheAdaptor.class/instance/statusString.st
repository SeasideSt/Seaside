accessing-readonly
statusString
	^ self isRunning 
		ifTrue: [ service greaseString ]
		ifFalse: [ super statusString ]