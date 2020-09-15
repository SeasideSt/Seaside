hooks
execute
	self adaptor
		ifNotNil: [ :adaptor | 
			adaptor isRunning ifFalse: [ ^ self ].
			WebBrowser openOn: 'http://localhost:' , adaptor port asString ]