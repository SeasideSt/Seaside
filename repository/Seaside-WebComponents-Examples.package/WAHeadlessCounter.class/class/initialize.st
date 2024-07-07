initialization
initialize
	| application |
	application := WAAdmin register: WAApplication at: 'examples/headless-counter' in: WAAdmin defaultDispatcher.
	application configuration addParent: WARenderLoopConfiguration instance.
	application rootClass: self;
		preferenceAt: #renderPhaseContinuationClass put: WAFragmentRenderPhaseContinuation;
		yourself