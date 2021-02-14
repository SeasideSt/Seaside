Extension { #name : #String }

{ #category : #'*javascript-core' }
String >> asFunction: aCollection [
	^ (JSStream on: self) asFunction: aCollection
]

{ #category : #'*javascript-core' }
String >> javascriptOn: aStream [
	JSStream encodeString: self on: aStream
]
