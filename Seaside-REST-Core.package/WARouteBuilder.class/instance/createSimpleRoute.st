private
createSimpleRoute
	^ WASimpleRoute
		method: method
		selector: compiled selector
		produces: produces
		consumes: (self createMimeTypeMatch: consumes)