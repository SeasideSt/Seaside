initialization
createContinuationCache
	"To configure the continuation cache you must currently subclass WASession and
	override this method."
	^ WAHashCache
		initialSize: 7
		maximumSize: 20
		maximumAbsoluteAge: 0
		maximumRelativeAge: 0
		overflowAction: WAHashCache removeRelativeOldest