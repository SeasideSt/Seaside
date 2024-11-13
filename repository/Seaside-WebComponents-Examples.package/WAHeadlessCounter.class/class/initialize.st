initialization
initialize
	| application |
	"register such that we do not have the developer tools"
	application := WAAdmin register: WAApplication at: 'examples/headless-counter' in: WAAdmin defaultDispatcher.
	application configuration addParent: WARenderLoopConfiguration instance.
	application
		rootClass: self;
		sessionClass: WASingleContinuationSession;
		preferenceAt: #renderPhaseContinuationClass put: WAFragmentRenderPhaseContinuation;
		preferenceAt: #actionPhaseContinuationClass put: WAWebComponentActionContinuation