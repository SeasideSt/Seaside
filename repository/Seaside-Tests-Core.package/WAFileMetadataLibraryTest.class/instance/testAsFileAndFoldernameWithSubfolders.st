tests
testAsFileAndFoldernameWithSubfolders
	| library fileAndFolderName |
	library := WATestingMetadataFileLibrary default.
	fileAndFolderName := library asFileAndFoldername: #jsbootstrapJs.
	
	self assert: fileAndFolderName first equals: library name, GRPlatform current pathSeparator, 'js'.
	self assert: fileAndFolderName last equals: 'bootstrap.js'