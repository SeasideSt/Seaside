Extension { #name : #InstructionStream }

{ #category : #'*Seaside-Pharo-Development' }
InstructionStream >> traversableInstVarIndexes [
	"sender will always get niled out when the stack unwound so won't be captured but
	this will not have happened yet for contexts involved in the current request."
	^ super traversableInstVarIndexes copyWithout:
		(self class allInstVarNames indexOf: 'sender')
]
