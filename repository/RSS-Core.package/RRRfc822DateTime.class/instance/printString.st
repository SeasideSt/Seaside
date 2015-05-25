printing
printString
	^ String streamContents: [ :stream | 
		self encodeOn: stream ]