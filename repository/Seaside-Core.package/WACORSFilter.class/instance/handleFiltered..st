handling
handleFiltered: aRequestContext

	(self isPreflight: aRequestContext request)
		ifTrue: [ self handleCORSPreflight: aRequestContext ]
		ifFalse: [ 
			(self isCORS: aRequestContext request) 
				ifTrue: [ self handleCORSFiltered: aRequestContext ]
				ifFalse: [ super handleFiltered: aRequestContext ] ]