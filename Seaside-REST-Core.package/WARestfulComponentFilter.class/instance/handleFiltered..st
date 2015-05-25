processing
handleFiltered: aRequestContext
	(self hasSession: aRequestContext)
		ifTrue: [
			"evetually let the application handle the request"
			self next handleFiltered: aRequestContext ]
		ifFalse: [
			"search for a route"
			super handleFiltered: aRequestContext ]
	