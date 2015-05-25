processing
handleFiltered: aRequestContext 
	self isClosed 
		ifFalse: [ super handleFiltered: aRequestContext ]
		ifTrue: [ 
			aRequestContext responseGenerator
				pageExpired;
				respond ]