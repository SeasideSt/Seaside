actions
editMemoryVMParameterAt: anInteger named: aString
	self show: ((WAVMParameterEditor paramterIndex: anInteger)
		addMessage: aString;
		yourself)