initialization
initializeOn: aHandler
	| cache |
	super initializeOn: aHandler.
	cache := self handler cache.
	cacheEditor := cache editorClass new
		configuration: cache;
		handler: handler;
		group: #cache;
		parent: self;
		yourself