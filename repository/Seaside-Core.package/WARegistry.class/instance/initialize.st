initialization
initialize
	super initialize.
	cache := WAMutualExclusionCache on: (WAHashCache
		initialSize: 13
		maximumSize: 0
		maximumAbsoluteAge: 28800 "8 h"
		maximumRelativeAge: 600 "10 min"
		overflowAction: nil).