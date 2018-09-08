utilities
script: aBlock on: aStream
	"Evaluate aBlock and pass in a script object that is subsequently written to aStream."

	| script document |
	document := (WAHtmlDocument
		on: aStream
		codec: self requestContext codec)
		scriptGenerator: self requestContext handler scriptGeneratorClass new;
		yourself.
	self renderContext document: document during: [ 
		script := (JSScript context: self renderContext)
			rendererClass: self rendererClass;
			yourself.
		aBlock value: script.
		script addAll: document loadScripts ].
	script javascriptOn: aStream