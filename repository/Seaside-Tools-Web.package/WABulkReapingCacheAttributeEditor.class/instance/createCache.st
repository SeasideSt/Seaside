private
createCache
	^ WABulkReapingCache
		initialSize: 13
		maximumSize: maximumSize
		maximumAbsoluteAge: maximumAbsoluteAge
		maximumRelativeAge: maximumRelativeAge
		overflowAction: overflowAction