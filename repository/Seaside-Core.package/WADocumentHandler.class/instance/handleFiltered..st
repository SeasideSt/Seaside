handling
handleFiltered: aRequestContext
	aRequestContext respond: [ :response |
		response
			cacheForever;
			document: self document ]