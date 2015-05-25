accessing-dynamic
leavesBySends
	^ String streamContents: [ :stream | 
		self tally leavesPrintExactOn: stream ]