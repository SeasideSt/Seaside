Extension { #name : #BlockClosure }

{ #category : #'*seaside-gemstone-json-core' }
BlockClosure >> jsonOn: aRenderer [
	self numArgs = 0
		ifTrue: [ self value ]
		ifFalse: [ self value: aRenderer ]
]
