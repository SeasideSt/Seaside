writing
writeEndBoundaryOn: stream
	stream
		nextPut: Character cr;
		nextPutAll: '--';
		nextPutAll: self boundary;
		nextPutAll: '--';
		nextPut: Character cr