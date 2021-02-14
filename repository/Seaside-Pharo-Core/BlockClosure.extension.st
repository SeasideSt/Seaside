Extension { #name : #BlockClosure }

{ #category : #'*Seaside-Pharo-Core' }
BlockClosure >> renderOn: aRenderer [
	self numArgs = 0
		ifTrue: [ self value ]
		ifFalse: [ self value: aRenderer ]
]
