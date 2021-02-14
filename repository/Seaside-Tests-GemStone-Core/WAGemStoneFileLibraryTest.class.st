Class {
	#name : #WAGemStoneFileLibraryTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-GemStone-Core'
}

{ #category : #testing }
WAGemStoneFileLibraryTest >> testAddAllFilesIn [
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
]

{ #category : #testing }
WAGemStoneFileLibraryTest >> testFileLibrary [
	"testing GRPlatform>>write:toFile:inFolder:"
	
	| directoryName |
	directoryName := 'XXXUsedBySeasideTests'.
	GRPlatform current ensureExistenceOfFolder: directoryName.
	GRPlatform current ensureExistenceOfFolder: directoryName.
	[| directory library |
	directory := ServerFileDirectory default directoryNamed: directoryName.
	[ | stream |
	stream := directory forceNewFileNamed: '.Seaside_Store'.
	stream close.
	GRPlatform current write: 'testing' toFile: '.Seaside_Store' inFolder: directory fullName.
	stream := directory forceNewFileNamed: 'foo'.
	stream close.
		library := WAFileLibrary
			subclass: #XXXTestFileLibrary
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: 'Uncategorized'.
		[ library addAllFilesIn: directory pathName.
		self assert: library selectors size = 1 ] "reject .Seaside_Store"
			ensure: [ library removeFromSystem ] ]
		ensure: [ directory deleteLocalFiles ] ]
		ensure: [ ServerFileDirectory default deleteDirectory: directoryName ]
]
