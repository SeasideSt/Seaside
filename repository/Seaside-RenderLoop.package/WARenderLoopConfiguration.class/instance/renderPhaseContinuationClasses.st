description
renderPhaseContinuationClasses
	^ self continuationClasses select: [ :each | each isRenderLoopContinuation and: [ each isRenderContinuation ] ]