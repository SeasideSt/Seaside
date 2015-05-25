scripts
jumpToAnchor: aString
	| actionContinuation |
	actionContinuation := self requestContext handlers
		detect: [ :each | each isActionContinuation ]
		ifNone: [ WAIllegalStateException signal: 'You can only send #jumpToAnchor: from within a callback' ].
	actionContinuation jumpToAnchor: aString