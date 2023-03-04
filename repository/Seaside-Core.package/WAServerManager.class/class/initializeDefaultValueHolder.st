class initialization
initializeDefaultValueHolder
	Default isNil ifTrue: [ 
		Default := GRPlatform current newTransientValueHolder ]