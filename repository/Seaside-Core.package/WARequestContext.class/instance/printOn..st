printing
printOn: aStream 
	super printOn: aStream.
	self request isNil 
		ifTrue: [ aStream nextPutAll: ' url: <nil>' ]
		ifFalse: [
			aStream
				nextPutAll: ' url: ';
				print: self request url greaseString ]