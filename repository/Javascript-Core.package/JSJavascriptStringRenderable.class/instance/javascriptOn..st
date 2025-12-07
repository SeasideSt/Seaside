utilities
javascriptOn: aRenderer
	"Need to render the renderable as a Javascript string with embedded html"
	| jsEncoder document |
	aRenderer document stream nextPut: $".
	jsEncoder := GRPlatform current javascriptEncoderOn: aRenderer context document stream.
	document := (WAHtmlDocument
		on: jsEncoder
		codec: self requestContext codec)
		scriptGenerator: self requestContext handler scriptGeneratorClass new;
		yourself.
	self renderContext document: document during: [
		(self rendererClass context: self renderContext)
			render: renderable; flush ].
	jsEncoder flushBuffer.
	document scriptGenerator closeOn: document.
	aRenderer document stream nextPut: $".