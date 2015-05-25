description
actionPhaseContinuationClasses
	^ self continuationClasses select: [ :each | each isRenderLoopContinuation and: [ each isActionContinuation ] ]