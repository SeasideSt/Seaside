accessing-dynamic
leavesBySends
	^ WAProfilerMessage message: (String streamContents: [ :stream | 
		self tally leavesPrintExactOn: stream ])