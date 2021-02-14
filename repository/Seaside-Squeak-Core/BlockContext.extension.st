Extension { #name : #BlockContext }

{ #category : #'*Seaside-Squeak-Core' }
BlockContext >> renderOn: aRenderer [
	self numArgs = 0
		ifTrue: [ self value ]
		ifFalse: [ self value: aRenderer ]
]
