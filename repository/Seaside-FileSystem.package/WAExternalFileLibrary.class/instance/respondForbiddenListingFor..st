handling
respondForbiddenListingFor: aRequestContext
	aRequestContext respond: [ :response |
		response
			forbidden;
			nextPutAll: 'Listing not allowed' ]