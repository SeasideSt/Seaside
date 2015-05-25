processing
processOn: aStream with: unused
	callback isNil
		ifFalse: [ self script: callback on: aStream ]