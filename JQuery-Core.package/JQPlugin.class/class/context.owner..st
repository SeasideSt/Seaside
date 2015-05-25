instance creation
context: aRenderContext owner: aQuery
	^ (self context: aRenderContext)
		setOwner: aQuery;
		yourself