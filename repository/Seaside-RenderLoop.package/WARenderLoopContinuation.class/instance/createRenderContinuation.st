private
createRenderContinuation
	"Answer a new render phase continuation."

	^ (self application preferenceAt: #renderPhaseContinuationClass) new