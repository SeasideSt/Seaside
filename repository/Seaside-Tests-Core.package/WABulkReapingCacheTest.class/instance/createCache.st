running
createCache
	^ WABulkReapingCache
		initialSize: 13
		maximumSize: 0
		maximumAbsoluteAge: 0
		maximumRelativeAge: 0
		overflowAction: WAHashCache signalError