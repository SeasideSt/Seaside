Extension { #name : 'Object' }

{ #category : '*javascript-core' }
Object >> asFunction [
	^ self asFunction: #()
]

{ #category : '*javascript-core' }
Object >> asFunction: aCollection [
	^ JSFunction new add: self; arguments: aCollection
]

{ #category : '*javascript-core' }
Object >> asJavascript [

	^ JSJavascriptCanvas builder render: [ :javascript |
		  self javascriptOn: javascript ]
]

{ #category : '*javascript-core' }
Object >> asJavascriptOn: aStream [

	^ JSJavascriptCanvas builder
		  render: [ :javascript | self javascriptOn: javascript ]
		  on: aStream
]

{ #category : '*javascript-core' }
Object >> isJavascript [
	^ false
]

{ #category : '*javascript-core' }
Object >> javascriptOn: aRenderer [
	self printOn: aRenderer document stream
]
