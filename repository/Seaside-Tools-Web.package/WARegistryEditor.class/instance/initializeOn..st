initialization
initializeOn: aHandler
	super initializeOn: aHandler.
	cacheEditor := WACacheAttributeEditor new
		configuration: self handler cache underlyingCache;
		handler: handler;
		group: #cache;
		parent: self;
		yourself