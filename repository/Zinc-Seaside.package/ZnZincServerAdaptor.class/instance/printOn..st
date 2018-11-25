printing
printOn: stream
	super printOn: stream.
	stream
		nextPut: $(;
		<< self statusString;
		nextPut: $)