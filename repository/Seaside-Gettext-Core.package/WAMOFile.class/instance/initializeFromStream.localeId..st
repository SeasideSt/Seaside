initialization
initializeFromStream: aStream localeId: aLocaleString
	self initialize.
	localeId := aLocaleString.
	self privateLoadStream: aStream