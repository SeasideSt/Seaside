Extension { #name : #BlockClosure }

{ #category : #'*Seaside-Squeak-Core' }
BlockClosure >> renderOn: aRenderer [
	self numArgs = 0
		ifTrue: [ self value ]
		ifFalse: [ self value: aRenderer ]
]
