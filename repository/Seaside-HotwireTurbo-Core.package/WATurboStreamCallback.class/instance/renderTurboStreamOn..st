evaluation
renderTurboStreamOn: aStream
	
	| document |
	document := (WAHtmlDocument
		on: aStream
		codec: self requestContext codec)
		scriptGenerator: self requestContext handler scriptGeneratorClass new;
		yourself.
	renderContext document: document during: [ 
		block value: (WATurboStreamBuilder newWithRenderContext: renderContext) ]