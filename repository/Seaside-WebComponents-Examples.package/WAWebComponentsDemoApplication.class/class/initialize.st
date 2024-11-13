initialization
initialize
	| application |
	"register such that we do not have the developer tools"
	application := WAAdmin register: WAApplication at: 'examples/web-components' in: WAAdmin defaultDispatcher.
	application configuration addParent: WARenderLoopConfiguration instance.
	application
		rootClass: self;
		scriptGeneratorClass: WANullScriptGenerator