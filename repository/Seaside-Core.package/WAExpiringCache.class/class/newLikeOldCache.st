instance creation
newLikeOldCache
	"creates a new cache configured similar to the one in Seaside <= 3.1"
	^ self initialSize: 13
		maximumSize: 0
		maximumAbsoluteAge: 0
		maximumRelativeAge: 600
		overflowAction: nil