values
at: aSymbol putClass: aClass
	^ self at: aSymbol put: (GRPlatform current bindingOf: aClass)