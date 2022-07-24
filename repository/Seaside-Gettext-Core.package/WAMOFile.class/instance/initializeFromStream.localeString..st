initialization
initializeFromStream: aStream localeString: aLocaleString
	self initialize.
	localeString := aLocaleString.
	self privateLoadStream: aStream