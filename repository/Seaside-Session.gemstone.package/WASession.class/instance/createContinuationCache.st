initialization
createContinuationCache
	"To configure the continuation cache you must currently subclass WASession and
	override this method.
	There is no need to use WABulkReapingCache for GemStone/S here because we're inside the session mutex."
	^ WAHashCache
		initialSize: 7
		maximumSize: 20
		maximumAbsoluteAge: 0
		maximumRelativeAge: 0
		overflowAction: WAHashCache removeRelativeOldest