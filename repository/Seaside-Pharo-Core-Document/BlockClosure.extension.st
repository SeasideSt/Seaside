Extension { #name : #BlockClosure }

{ #category : #'*seaside-pharo-core' }
BlockClosure >> renderOn: aRenderer [
	self numArgs = 0
		ifTrue: [ self value ]
		ifFalse: [ self value: aRenderer ]
]
