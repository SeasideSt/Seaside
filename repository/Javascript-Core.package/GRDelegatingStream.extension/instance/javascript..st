*javascript-core
javascript: anObject
	| document context canvas |
	document := JSJavascriptDocument on: self.
	context := WARenderContext new
		actionUrl: WAUrl new;
		document: document;
		yourself.
	canvas := JSJavascriptCanvas context: context.
	canvas render: anObject.
	document close