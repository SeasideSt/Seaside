private
createComplexRoute
	^ WAComplexRoute
		method: method selector: compiled selector pattern: path
		arguments: (GRPlatform current argumentNamesOf: compiled)
		produces: produces
		consumes: (self createMimeTypeMatch: consumes)