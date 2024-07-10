initialization
initialize
	| application |
	"register such that we do not have the developer tools"
	application := WAAdmin register: WAApplication at: 'examples/headless-counter' in: WAAdmin defaultDispatcher.
	application configuration addParent: WARenderLoopConfiguration instance.
	application rootClass: self.
	application preferenceAt: #renderPhaseContinuationClass put: WAFragmentRenderPhaseContinuation