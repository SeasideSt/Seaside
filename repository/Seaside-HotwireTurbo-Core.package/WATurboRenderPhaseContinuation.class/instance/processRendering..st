processing
processRendering: aResponse

	(self requestContext request isTurboFrameRequest or: [ 
		 self requestContext request isTurboStreamRequest ])
		ifTrue: [ 
			turboStreamCallback
				ifNil: [ self requestContext request isTurboFrameRequest 
					ifTrue: [ self processTurboFrameRendering: aResponse ]
					ifFalse: [ super processRendering: aResponse ] ]
				ifNotNil: [ self processTurboStreamRendering: aResponse ] ]
		ifFalse: [ super processRendering: aResponse ]