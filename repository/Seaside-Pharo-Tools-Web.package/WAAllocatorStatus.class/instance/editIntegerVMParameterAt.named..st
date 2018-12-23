actions
editIntegerVMParameterAt: anInteger named: aString 
	self 
		request: aString
		default: (SmalltalkImage current vm parameterAt: anInteger)
		onAnswer: [ :value | 
			SmalltalkImage current vm
				parameterAt: anInteger
				put: value greaseInteger ]