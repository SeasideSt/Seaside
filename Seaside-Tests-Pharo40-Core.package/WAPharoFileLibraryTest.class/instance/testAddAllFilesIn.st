tests
testAddAllFilesIn
	| workingDirectory directoryName directory library |
	directoryName := 'XXXUsedBySeasideTests'.
	workingDirectory := FileSystem disk workingDirectory.
	GRPlatform current ensureExistenceOfFolder: directoryName.
	directory :=workingDirectory / directoryName.
	[ [
		(directory / '.Seaside_Store') ensureCreateFile .
		(directory / 'foo') ensureCreateFile.
		GRPlatform current doSilently: [
			library := WAFileLibrary
				subclass: #XXXTestFileLibrary
				instanceVariableNames: ''
				classVariableNames: ''
				poolDictionaries: ''
				category: 'Uncategorized'.
		[ library addAllFilesIn: directory fullName.
			self assert: library selectors size = 1 ] "reject .Seaside_Store"
				ensure: [ library removeFromSystem ] ] ]
			ensure: [ directory children do: [ :each | each delete ] ] ]
			ensure: [ directory delete ]