processing
processRendering: aResponse

	self requestContext request isTurboFrameRequest
		ifTrue: [ 
			aResponse
				doNotCache;
				contentType: self application contentType.
			self renderTurboFrameResponseOn: aResponse stream ]
		ifFalse: [ super processRendering: aResponse ]