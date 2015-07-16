initialization
initializeFilters
	self addFilter: (GRPlatform current createMutualExclusionFilter)