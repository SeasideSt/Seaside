*seaside-gemstone-session
createSessionCacheForApplication: anApplication

	^ WABulkReapingCache
		initialSize: 13
		maximumSize: (anApplication configuration at: #maximumSize)
		maximumAbsoluteAge: (anApplication configuration at: #maximumAbsoluteAge)
		maximumRelativeAge: (anApplication configuration at: #maximumRelativeAge)
		overflowAction: (anApplication configuration at: #overflowAction)