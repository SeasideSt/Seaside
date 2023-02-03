converting
responseFor: aZnRequest

	^ aZnRequest isSafeToStream
		  ifTrue: [ self streamingResponseFor: aZnRequest ]
		  ifFalse: [ self bufferedResponseFor: aZnRequest ]