processing
respondCookiesRequired: aRequestContext
	aRequestContext
		respond: [ :response | 
			response
				forbidden;
				nextPutAll: self cookiesRequiredStatement  ]