accessing-dynamic
stats
	^ String streamContents: [ :stream | 
		self tally reportGCStatsOn: stream ]