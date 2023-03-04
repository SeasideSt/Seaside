class initialization
ensureDefaultValueHolder
	Default isNil ifTrue: [ 
		Default := GRPlatform current newTransientValueHolder ]