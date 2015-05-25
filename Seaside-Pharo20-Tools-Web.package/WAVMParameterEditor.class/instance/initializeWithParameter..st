initialization
initializeWithParameter: anInteger
	self initialize.
	parameterIndex := anInteger.
	memoryInput := WAMemoryInput bytes: (SmalltalkImage current vmParameterAt: anInteger)