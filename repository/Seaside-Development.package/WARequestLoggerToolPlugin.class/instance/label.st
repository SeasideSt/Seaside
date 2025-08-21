accessing
label
	^ self isLogging
		ifFalse: [ 'Log' ]
		ifTrue: [ 'Stop Log' ]