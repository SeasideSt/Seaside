Extension { #name : #Character }

{ #category : #'*javascript-core' }
Character >> javascriptOn: aStream [
	(String with: self) javascriptOn: aStream
]
