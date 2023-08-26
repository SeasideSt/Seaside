rendering
renderTurboFrameResponseOn: aStream
	"Render aRenderable on aStream."
	
	| document turboframeId |
	turboframeId := self requestContext request headerAt: 'turbo-frame'.
	document := (WAHtmlDocument on: aStream codec: self requestContext codec)
		scriptGenerator: self requestContext handler scriptGeneratorClass new;
		yourself.
	renderContext 
		document: document 
		during: [
			renderContext 
				visitor: ((WATurboFramePresenterGuide client: (WARenderVisitor context: renderContext)) id: turboframeId) 
				during: [
					self presenter renderWithContext: renderContext ]
					"self presenter allPresentersDo: [ :p | ((p isKindOf: WATurboFrame) and: [ turboframeId = p id ]) ifTrue:[ self halt. p renderWithContext: renderContext ] ]" ].
	document scriptGenerator closeOn: document