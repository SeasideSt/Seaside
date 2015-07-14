*seaside-gemstone-environment
handleGemStoneException: anException
	| grPlatform |
	(Error handles: anException)
		ifTrue: [ ^ self handleError: anException ].
	(Warning handles: anException)
		ifTrue: [ ^ self handleWarning: anException ].
	grPlatform := GRPlatform current.
	(grPlatform handlesHaltException: anException)
		ifTrue: [ ^ self handleHalt: anException ].
	(grPlatform handlesAlmostOutOfStackException: anException)
		ifTrue: [ ^ self handleAlmostOutOfStack: anException ].
	(grPlatform handlesBreakpointException: anException)
		ifTrue: [ ^ self handleBreakpoint: anException ].
	^super handleGemStoneException: anException