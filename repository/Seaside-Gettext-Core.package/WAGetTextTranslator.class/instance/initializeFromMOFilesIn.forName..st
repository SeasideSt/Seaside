initialization
initializeFromMOFilesIn: aDirectoryPathString forName: anApplicationName
  self initialize.
  (GRPlatform current directoriesIn: aDirectoryPathString)
    do: [ :dirPathString | self addMOFileFromPath: dirPathString forName: anApplicationName ]