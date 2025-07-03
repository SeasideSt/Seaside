rendering
processTurboFrameRendering: aResponse
	
	| document turboframeId |
	aResponse
		doNotCache;
		contentType: self application contentType.
	turboframeId := self requestContext request headerAt: 'turbo-frame'.
	document := (WAHtmlDocument on: aResponse stream codec: self requestContext codec)
		scriptGenerator: self requestContext handler scriptGeneratorClass new;
		yourself.
	renderContext 
		document: document 
		during: [
			renderContext 
				visitor: ((WATurboFramePresenterGuide client: (WARenderVisitor context: renderContext)) id: turboframeId) 
				during: [
					self presenter renderWithContext: renderContext ] ].
	document scriptGenerator closeOn: document