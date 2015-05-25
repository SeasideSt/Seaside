processing
handleFiltered: aRequestContext
	aRequestContext response frameOptions: self frameOptions.
	super handleFiltered: aRequestContext