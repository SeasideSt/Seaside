hooks
initialRequest: aRequest
	super initialRequest: aRequest.
	initialRequestBlock isNil
		ifFalse: [ initialRequestBlock value: aRequest ]