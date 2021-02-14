Extension { #name : #GRSmallOrderedSet }

{ #category : #'*javascript-core' }
GRSmallOrderedSet >> javascriptOn: aStream [
	JSStream encodeCollection: self on: aStream
]
