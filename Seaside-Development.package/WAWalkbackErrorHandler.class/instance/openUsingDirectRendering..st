actions
openUsingDirectRendering: anException
	| debugAction |
	"we pressed the debug link,
	we intentionally don't reset otherwise we'd loose the response
	up to now when proceed is pressed in the debugger"
	debugAction := self requestContext request at: '_debugAction' ifAbsent: [ nil ].
	debugAction = '_debug'
		ifTrue: [ ^ super open: anException ].
	debugAction = '_proceed'
		ifTrue: [ ^ self basicResume: anException ].
	self requestContext response resetIfPossible
		ifTrue: [
			| fullStack renderer |
			fullStack := debugAction = '_fullStack'.
			
			renderer := WAWalkback current exception: anException.
			fullStack ifTrue: [ renderer showFullStack ].
			
			self requestContext respond: [ :response  |
				"set to HTML and set encoding"
				response
					contentType: self application contentType;
					nextPutAll: (WAHtmlCanvas builder
						fullDocument: true;
						rootBlock: [ :root | renderer updateRoot: root ];
						render: renderer)  ] ]
		ifFalse: [
			"we could not reset the response so we just open a debugger (similar to XmlHttpRequest)"
			super open: anException ]