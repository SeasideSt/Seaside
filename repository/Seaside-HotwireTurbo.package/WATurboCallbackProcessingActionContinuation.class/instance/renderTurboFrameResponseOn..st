rendering
renderTurboFrameResponseOn: aStream
	"Render aRenderable on aStream."
	
	| document turboframeId |
	turboframeId := self requestContext request headerAt: 'turbo-frame'.
	document := (WAHtmlDocument on: aStream codec: self requestContext codec)
		scriptGenerator: self requestContext handler scriptGeneratorClass new;
		yourself.
	self renderContext 
		document: document 
		during: [
			self renderContext 
				visitor: ((WATurboFramePresenterGuide client: (WARenderVisitor context: renderContext)) id: turboframeId) 
				during: [
					self presenter renderWithContext: renderContext ] ].
	document scriptGenerator closeOn: document
	
