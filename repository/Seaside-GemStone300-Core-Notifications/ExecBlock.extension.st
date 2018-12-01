Extension { #name : #ExecBlock }

{ #category : #'*seaside-gemstone300-core' }
ExecBlock >> handleRequest: aRequest [
	^ self value: aRequest
]

{ #category : #'*seaside-gemstone300-core' }
ExecBlock >> renderOn: aRenderer [
	self numArgs == 0 
		ifTrue: [self value]
		ifFalse: [self value: aRenderer]
]
