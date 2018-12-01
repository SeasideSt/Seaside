Extension { #name : #ExecBlock }

{ #category : #'*seaside-gemstone320-core' }
ExecBlock >> handleRequest: aRequest [
	^ self value: aRequest
]

{ #category : #'*seaside-gemstone320-core' }
ExecBlock >> renderOn: aRenderer [
	self numArgs == 0 
		ifTrue: [self value]
		ifFalse: [self value: aRenderer]
]
