private
createActionContinuationWithContext: aRenderContext
	"Answer a new action phase continuation."

	^ self actionPhaseContinuationClass snapshot: self states renderContext: aRenderContext