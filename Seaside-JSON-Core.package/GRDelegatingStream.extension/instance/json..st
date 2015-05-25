*seaside-json-core
json: anObject
	| document context canvas |
	document := WAJsonDocument on: self.
	context := WARenderContext new
		actionUrl: WAUrl new;
		document: document;
		yourself.
	canvas := WAJsonCanvas context: context.
	canvas render: anObject.
	document close