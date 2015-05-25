utilities
render: aRenderable on: aStream
	"Render aRenderable on aStream."
	
	| document |
	document := WAHtmlDocument
		on: aStream
		codec: self requestContext codec.
	self renderContext document: document during: [
		(self rendererClass context: self renderContext)
			render: aRenderable; flush ].
	document scriptGenerator closeOn: document