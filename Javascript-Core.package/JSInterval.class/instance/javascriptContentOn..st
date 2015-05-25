printing
javascriptContentOn: aStream
	aStream nextPutAll: 'setInterval(function(){'.
	super javascriptContentOn: aStream.
	aStream
		nextPutAll: '},';
		javascript: self duration;
		nextPut: $)