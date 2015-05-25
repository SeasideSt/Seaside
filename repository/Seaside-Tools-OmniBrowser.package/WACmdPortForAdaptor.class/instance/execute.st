execution
execute
	| port |
	port := OBTextRequest 
		prompt: 'Enter port number'
		template: target adaptor port greaseString.
	(port isNil or: [ port isEmpty or: [ port isAllDigits not ] ]) ifTrue: [ ^ self ].
	target adaptor port: port greaseInteger.
	requestor browser signalRefresh