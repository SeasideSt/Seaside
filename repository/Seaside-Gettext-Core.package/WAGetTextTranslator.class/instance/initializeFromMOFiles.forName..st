initialization
initializeFromMOFiles: aDirectoryWithLocaleDirectories forName: anApplicationName
	self initialize.
	moFiles := Dictionary new.
	(GRPlatform current directoriesIn: aDirectoryWithLocaleDirectories pathString) do: [ :dirPathString |
			self addMOFileFromPath: dirPathString forName: anApplicationName ]