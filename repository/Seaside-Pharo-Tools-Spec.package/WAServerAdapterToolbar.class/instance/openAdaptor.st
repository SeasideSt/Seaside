actions
openAdaptor

	| postfix |
	self owner adaptor ifNotNil: [ :adaptor |
		adaptor isRunning ifFalse: [ ^false ].
		postfix := adaptor port = 80 
									ifTrue: [ '']
									ifFalse: [ ':', adaptor port asString ].
		WebBrowser openOn: 'http://localhost', postfix 	]