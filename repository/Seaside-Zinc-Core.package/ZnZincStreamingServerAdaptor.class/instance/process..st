processing
process: aZnRequest
	^ ZnDeferredResponse
		onWrite: [ :stream | 
			| request |
			request := ZnSeasideRequest 
				nativeRequest: aZnRequest
				stream: stream.
			super process: request ]