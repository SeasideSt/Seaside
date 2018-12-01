Extension { #name : #Collection }

{ #category : #'*javascript-core' }
Collection >> javascriptOn: aStream [
	JSStream encodeCollection: self on: aStream
]
