Extension { #name : 'BinaryFloat' }

{ #category : '*javascript-gemstone-core' }
BinaryFloat >> javascriptOn: aRenderer [

	self isNaN ifTrue: [
		^ aRenderer document nan ].
	self isInfinite ifTrue: [
		^ self positive
			ifTrue: [ aRenderer document infinity ]
			ifFalse: [ aRenderer document negativeInfinity ] ].

	self printOn: aRenderer document stream base: 10
]
