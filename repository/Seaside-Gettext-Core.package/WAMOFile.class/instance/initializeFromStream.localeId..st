initialization
initializeFromStream: aStream localeId: aLocaleString
	self initialize.
	localeString := aLocaleString.
	self privateLoadStream: aStream