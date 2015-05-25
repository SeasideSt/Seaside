handling
handleFiltered: aRequestContext
	[ self processContext: aRequestContext ] 
		on: Error
		do: [ :error | 
			aRequestContext responseGenerator
				internalError: error;
				respond ]