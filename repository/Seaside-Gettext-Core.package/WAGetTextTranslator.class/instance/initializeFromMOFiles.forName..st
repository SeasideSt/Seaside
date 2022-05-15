initialization
initializeFromMOFiles: aDirectoryWithLocaleDirectories forName: anApplicationName
	self initialize.
	moFiles := Dictionary new.
	(GRPlatform current directoriesIn: aDirectoryWithLocaleDirectories) do: [ :dir |
			self addMOFileFromPath: dir forName: anApplicationName ]