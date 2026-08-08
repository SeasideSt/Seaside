accessing-dynamic
leavesByTime
	^ String streamContents: [ :stream | 
		self tally leavesPrintOn: stream threshold: 1 ]