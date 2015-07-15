initialization
initializeFilters
	"For GemStone, mutual exclusion is handled by an object lock, see handle:.
	 Over the long haul, I suppose that I could specialize the MutualExclusionFilter for GemStone..."
	
	true ifTrue: [ ^self ].
	self addFilter: WAMutualExclusionFilter new