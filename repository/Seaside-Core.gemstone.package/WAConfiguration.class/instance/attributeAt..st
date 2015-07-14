attributes
attributeAt: aSymbol
	^ self attributeAt: aSymbol ifAbsent: [ WAAttributeNotFound signalWithKey: aSymbol ]