adapting
answerResponderRole: aFSResponderRole 

	| string |
	[ string := self process: aFSResponderRole ] 
		on: Error 
		do: [:ex | 
			string := self internalServerMalfunction: ex.
			"Do an explicit return. Because of the abort above, the default action for an exception (resume) is set. see bug39246."
			ex return: nil].
	aFSResponderRole nextPutAll: string.
	^true