private
createActionContinuationWithContext: aRenderContext
	"Answer a new action phase continuation."

	^ (self application preferenceAt: #actionPhaseContinuationClass) snapshot: self states renderContext: aRenderContext