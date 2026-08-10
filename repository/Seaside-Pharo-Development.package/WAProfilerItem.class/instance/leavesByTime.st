accessing-dynamic
leavesByTime
	^ WAProfilerMessage message: (String streamContents: [ :stream | 
		self tally leavesPrintOn: stream threshold: 1 ])