tests
testAddAllFilesIn
	| workingDirectory directory library |
	workingDirectory := FileSystem disk workingDirectory.
	workingDirectory = FileSystem root ifTrue: [
		"on Pharo 7+ #workingDirectory answers the root if the vm was stared by double clicking or drag and drop"
		workingDirectory := FileLocator imageDirectory ].
	directory := workingDirectory / 'XXXUsedBySeasideTests'.
	GRPlatform current ensureExistenceOfFolder: directory pathString.
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