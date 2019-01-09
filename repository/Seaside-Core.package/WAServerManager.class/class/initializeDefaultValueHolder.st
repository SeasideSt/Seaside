class initialization
initializeDefaultValueHolder
	default isNil ifTrue: [ 
		default := GRPlatform current newTransientValueHolder ]