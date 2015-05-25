accessing
fileSizeOf: aSelector
	^ (self fileResourceOf: aSelector) contents value size