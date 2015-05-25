printing
javascriptContentOn: aStream
	aStream nextPutAll: 'setTimeout(function(){'.
	super javascriptContentOn: aStream.
	aStream
		nextPutAll: '},';
		javascript: self duration;
		nextPut: $)