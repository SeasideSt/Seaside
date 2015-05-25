actions
setBiasToGrowLimit
	self 
		request: 'GC Bias To Grow GC Limit (bytes)'
		onAnswer: [ :limit | Smalltalk setGCBiasToGrowGCLimit: limit greaseInteger ]