processing
handleFiltered: aRequestContext
	aRequestContext response headerAt: 'Content-Security-Policy' put: 'default-src ''self'''.
	super handleFiltered: aRequestContext