protocol
isExpired: anObject key: aString
	| lastAccess |
	lastAccess := lastAccessTable at: aString ifAbsent: [ Time totalSeconds ].
	^ (Time totalSeconds - lastAccess) > self timeout