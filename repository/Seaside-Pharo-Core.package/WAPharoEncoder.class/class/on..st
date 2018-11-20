instance creation
on: aStream
	^ self basicNew
		initializeOn: aStream
		table: table
		delegate: (self delegateOn: aStream)