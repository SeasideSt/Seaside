processing
processRendering: aResponse

	(self requestContext request isTurboFrameRequest or: [ 
		 self requestContext request isTurboStreamRequest ])
		ifTrue: [ 
			turboStreamCallback
				ifNil: [ self processTurboFrameRendering: aResponse ]
				ifNotNil: [ self processTurboStreamRendering: aResponse ] ]
		ifFalse: [ super processRendering: aResponse ]