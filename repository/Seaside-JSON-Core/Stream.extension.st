Extension { #name : #Stream }

{ #category : #'*seaside-json-core' }
Stream >> json: anObject [
	| document context canvas |
	document := WAJsonDocument on: self.
	context := WARenderContext new
		actionUrl: WAUrl new;
		document: document;
		yourself.
	canvas := WAJsonCanvas context: context.
	canvas render: anObject.
	document close
]
