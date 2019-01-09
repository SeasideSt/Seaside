private
createCache
	^ WAMutualExclusionCache on: (WAHashCache
		initialSize: 13
		maximumSize: maximumSize
		maximumAbsoluteAge: maximumAbsoluteAge
		maximumRelativeAge: maximumRelativeAge
		overflowAction: overflowAction)