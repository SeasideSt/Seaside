initialization
initializeFromMOFiles: aDirectoryWithLocaleDirectories forName: anApplicationName
	self initialize.
	moFiles := Dictionary new.
	aDirectoryWithLocaleDirectories directories do: [ :dir |
			self addMOFileFromPath: dir forName: anApplicationName ]