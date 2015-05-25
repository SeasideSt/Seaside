processing
processOn: aStream with: unused
	callback isNil
		ifFalse: [ callback value ]