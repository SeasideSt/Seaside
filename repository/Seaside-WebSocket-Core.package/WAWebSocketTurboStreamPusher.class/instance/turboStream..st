public
turboStream: aBlock
	"Evaluate aBlock with an WATurboStreamBuilder and push the resulting turbostream element to all associated websockets."

	| renderContext turboStreamElement |
	turboStreamElement := (String streamContents: [ :stream |
			 | document |
			 document := (WAHtmlDocument
				              on: stream
				              codec: self requestContext codec)
				             scriptGenerator:  self requestContext handler scriptGeneratorClass new;
				             yourself.
			 renderContext := self renderContext.
			 renderContext document: document during: [
				 aBlock value:
					 (WATurboStreamBuilder newWithRenderContext: renderContext) ] ]).
	self push: turboStreamElement