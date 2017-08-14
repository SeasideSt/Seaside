tests
testAsFileAndFoldernameWithSubfolders
	| library fileAndFolderName |
	library := WATestingMetadataFileLibrary default.
	fileAndFolderName := library asFileAndFoldername: #jsbootstrapJs.
	self
		assert: fileAndFolderName first equals: ('<1s><2s><3s>' expandMacrosWith: library name with: GRPlatform current pathSeparator  with: 'js' );
		assert: fileAndFolderName last equals: 'bootstrap.js'