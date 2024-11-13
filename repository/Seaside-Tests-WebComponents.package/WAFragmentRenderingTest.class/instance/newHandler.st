private
newHandler
	| application |
	application := WAApplication new.
	application configuration
		addParent: WARenderLoopConfiguration instance.
	^ application
		rootClass: WACounter;
		preferenceAt: #renderPhaseContinuationClass put: WAFragmentRenderPhaseContinuation;
		yourself