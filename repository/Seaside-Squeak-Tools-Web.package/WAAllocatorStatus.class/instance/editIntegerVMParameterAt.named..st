actions
editIntegerVMParameterAt: anInteger named: aString 
	self 
		request: aString
		default: (SmalltalkImage current vmParameterAt: anInteger)
		onAnswer: [ :value | 
			SmalltalkImage current 
				vmParameterAt: anInteger
				put: value greaseInteger ]