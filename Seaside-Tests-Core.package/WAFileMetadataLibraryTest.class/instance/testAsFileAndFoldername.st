tests
testAsFileAndFoldername
	| library |
	library := WATestingMetadataFileLibrary default.
	self assert: (library asFileAndFoldername: #mainCss) first equals: library name