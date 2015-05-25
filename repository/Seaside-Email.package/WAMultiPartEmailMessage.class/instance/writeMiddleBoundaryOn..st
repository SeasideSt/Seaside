writing
writeMiddleBoundaryOn: stream
	stream
		nextPut: Character cr;
		nextPutAll: '--';
		nextPutAll: self boundary;
		nextPut: Character cr