description
libraryClasses
	^ WAAbstractFileLibrary libraries asSortedCollection: [ :a :b | a name <= b name ]