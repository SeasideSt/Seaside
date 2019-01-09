testing
testAddAllFilesIn
	| directoryName |
	directoryName := 'XXXUsedBySeasideTests'.
	ServerFileDirectory default createDirectory: directoryName.
	[| directory library |
	directory := ServerFileDirectory default directoryNamed: directoryName.
	[ (directory forceNewFileNamed: '.Seaside_Store') close .
	(directory forceNewFileNamed: 'foo') close .
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
		ensure: [ ServerFileDirectory default deleteDirectory: directoryName ]