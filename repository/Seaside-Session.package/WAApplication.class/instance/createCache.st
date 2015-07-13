initialization
createCache
	^ WAMutualExclusionCache on: (WAHashCache
		initialSize: 13
		maximumSize: (self configuration at: #maximumSize)
		maximumAbsoluteAge: (self configuration at: #maximumAbsoluteAge)
		maximumRelativeAge: (self configuration at: #maximumRelativeAge)
		overflowAction: (self configuration at: #overflowAction))