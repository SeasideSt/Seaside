Extension { #name : 'Float' }

{ #category : '*Javascript-Pharo-Core' }
Float >> javascriptOn: aRenderer [
	self isNaN ifTrue: [
		^ aRenderer document nan ].
	self isInfinite ifTrue: [
		^ self positive
			ifTrue: [ aRenderer document infinity ]
			ifFalse: [ aRenderer document negativeInfinity ] ].
	super javascriptOn: aRenderer
]
