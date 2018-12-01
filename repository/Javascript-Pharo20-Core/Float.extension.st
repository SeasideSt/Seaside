Extension { #name : #Float }

{ #category : #'*javascript-pharo20-core' }
Float >> javascriptOn: aStream [
	self isNaN ifTrue: [
		^ aStream nextPutAll: 'NaN' ].
	self isInfinite ifTrue: [
		^ aStream nextPutAll: (self positive ifTrue: [ 'Infinity' ] ifFalse: [ '-Infinity' ]) ].
	super javascriptOn: aStream
]
