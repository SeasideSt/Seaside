initialization
initializeOn: aCompiledMethod
	self initialize.
	compiled := aCompiledMethod.
	method := 'GET'.
	path := aCompiledMethod selector greaseString.
	consumes := OrderedCollection new.
	produces := WAWildcardMimeTypeMatch new