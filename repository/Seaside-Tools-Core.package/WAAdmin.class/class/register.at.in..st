registration
register: aRequestHandlerClass at: aString in: aDispatcher
	| path dispatcher |
	path := aString subStrings: '/'.
	dispatcher := path allButLast
		inject: aDispatcher
		into: [ :result :each |
			result handlers 
				at: each
				ifAbsent: [ result register: WADispatcher new at: each ] ].
	^ dispatcher register: aRequestHandlerClass new at: path last