Extension { #name : #BlockContext }

{ #category : #'*seaside-pharo-core' }
BlockContext >> renderOn: aRenderer [
	self numArgs = 0
		ifTrue: [ self value ]
		ifFalse: [ self value: aRenderer ]
]
