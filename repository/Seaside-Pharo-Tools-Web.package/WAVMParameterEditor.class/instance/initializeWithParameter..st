initialization
initializeWithParameter: anInteger
	self initialize.
	parameterIndex := anInteger.
	memoryInput := WAMemoryInput bytes: (SmalltalkImage current vm parameterAt: anInteger)