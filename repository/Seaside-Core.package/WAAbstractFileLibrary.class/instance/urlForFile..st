accessing
urlForFile: aFilename
	^ self urlOf: (self asSelector: aFilename)