tests
testAddAllFilesIn
	| directoryName |
	directoryName := 'XXXUsedBySeasideTests'.
	FileDirectory default createDirectory: directoryName.
	[ | directory library |
	directory := FileDirectory default directoryNamed: directoryName.
	[ (directory forceNewFileNamed: '.Seaside_Store') in: [ :stream | stream close ].
	(directory forceNewFileNamed: 'foo') in: [ :stream | stream close ].
	SystemChangeNotifier uniqueInstance doSilently: [
		library := WAFileLibrary
			subclass: #XXXTestFileLibrary
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: 'Uncategorized'.
		[ library addAllFilesIn: directory pathName.
		self assert: library selectors size = 1 ] "reject .Seaside_Store"
			ensure: [ library removeFromSystem ] ] ]
		ensure: [ directory deleteLocalFiles ] ]
		ensure: [ FileDirectory default deleteDirectory: directoryName ]