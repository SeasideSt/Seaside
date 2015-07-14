operations
taskNamed: aString

	^ self taskNamed: aString ifAbsent: [ ^nil ]