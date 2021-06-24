as yet unclassified
temporaryFileDirectory
	^ TemporaryFileDirectory ifNil: [
		TemporaryFileDirectory := FileLocator temp asFileReference ]