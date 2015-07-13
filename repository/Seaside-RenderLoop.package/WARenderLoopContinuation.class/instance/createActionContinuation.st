private
createActionContinuation
	"Answer a new action phase continuation."

	^ self actionPhaseContinuationClass snapshot: self states