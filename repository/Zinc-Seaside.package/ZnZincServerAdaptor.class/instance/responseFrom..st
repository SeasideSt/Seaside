converting
responseFrom: aRequestContext

	^ aRequestContext request isSafeToStream
		  ifTrue: [ self streamingResponseFrom: aRequestContext ]
		  ifFalse: [ self bufferedResponseFrom: aRequestContext ]