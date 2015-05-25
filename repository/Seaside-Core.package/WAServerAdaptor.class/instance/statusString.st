accessing-readonly
statusString
	^ self isRunning
		ifTrue: [ 'running' ]
		ifFalse: [ 'stopped' ]