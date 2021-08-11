handling
handleFiltered: aRequestContext

	"Pass on the aRequestContext to the next filter or handler. Subclasses might override this method to customize the request and response handling."

	(self isPreflight: aRequestContext request)
		ifTrue: [ self handleCORSPreflight: aRequestContext ]
		ifFalse: [ 
			(self isCORS: aRequestContext request) 
				ifTrue: [ self handleCORSFiltered: aRequestContext ]
				ifFalse: [ super handleFiltered: aRequestContext ]]