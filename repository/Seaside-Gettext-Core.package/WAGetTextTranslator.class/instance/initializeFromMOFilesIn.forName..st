initialization
initializeFromMOFilesIn: aDirectoryPathString forName: anApplicationName
	self initialize.
	moFilePerLocaleId := Dictionary new.
	(GRPlatform current directoriesIn: aDirectoryPathString) do: [ :dirPathString |
			self addMOFileFromPath: dirPathString forName: anApplicationName ]