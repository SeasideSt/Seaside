handling
handleFiltered: aRequestContext named: aString
	(self 
		handlerAt: aString 
		ifAbsent: [ aRequestContext responseGenerator notFound; respond ])
			handle: aRequestContext