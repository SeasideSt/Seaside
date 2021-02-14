Extension { #name : #Object }

{ #category : #'*javascript-core' }
Object >> asFunction [
	^ self asFunction: #()
]

{ #category : #'*javascript-core' }
Object >> asFunction: aCollection [
	^ JSFunction new add: self; arguments: aCollection
]

{ #category : #'*javascript-core' }
Object >> asJavascript [
	^ String streamContents: [ :stream | self javascriptOn: stream ]
]

{ #category : #'*javascript-core' }
Object >> isJavascript [
	^ false
]

{ #category : #'*javascript-core' }
Object >> javascriptOn: aStream [
	self printOn: aStream
]
