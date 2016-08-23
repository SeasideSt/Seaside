registration
register: aRequestHandlerClass at: aString in: aDispatcher
	| dispatcher subStrings |
	dispatcher := aDispatcher.
	subStrings := GRPlatform subStringsIn: aString splitBy: $/.
	subStrings allButLastDo: [ :each |
		dispatcher := dispatcher handlers 
				at: each
				ifAbsent: [ dispatcher register: WADispatcher new at: each ] ].
	^ dispatcher register: aRequestHandlerClass new at: subStrings last