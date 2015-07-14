processing
handleFiltered: aRequestContext 
	(self verifyRequest: aRequestContext request) 
		ifTrue: [ super handleFiltered: aRequestContext ]
		ifFalse: [
			aRequestContext responseGenerator
				authenticate: self realm;
				respond ]