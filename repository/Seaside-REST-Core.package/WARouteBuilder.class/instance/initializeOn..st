initialization
initializeOn: aCompiledMethod
	self initialize.
	compiled := aCompiledMethod.
	method := 'GET'.
	variableQuery := false.
	path := aCompiledMethod selector greaseString.
	consumes := OrderedCollection new.
	produces := WAWildcardMimeTypeMatch new