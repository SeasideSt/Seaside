Extension { #name : 'Stream' }

{ #category : '*javascript-core' }
Stream >> javascript: anObject [
	JSJavascriptCanvas builder
		render: anObject
		on: self
]
