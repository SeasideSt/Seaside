handling
handleCORSFiltered: aRequestContext

	self addCORSHeadersTo: aRequestContext response.
	super handleFiltered: aRequestContext.