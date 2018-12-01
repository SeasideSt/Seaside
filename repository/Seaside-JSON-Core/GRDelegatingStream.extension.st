Extension { #name : #GRDelegatingStream }

{ #category : #'*seaside-json-core' }
GRDelegatingStream >> json: anObject [
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
