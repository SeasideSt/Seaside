processing
process: aZnRequest

	^ aZnRequest isSafeToStream
		  ifTrue: [ 
			  ZnDeferredResponse onWrite: [ :stream | 
				  | request |
				  request := ZnSeasideRequest
					             nativeRequest: aZnRequest
					             stream: stream.
				  super process: request ] ]
		  ifFalse: [ super process: aZnRequest ]