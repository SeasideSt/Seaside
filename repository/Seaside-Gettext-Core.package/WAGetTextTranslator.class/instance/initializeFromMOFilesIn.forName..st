initialization
initializeFromMOFilesIn: aDirectoryPathString forName: anApplicationName
  self initialize.
  moFilePerLocaleId := Dictionary new.
  Transcript show: 'Initializing gettexttranslator from ' , aDirectoryPathString.
  (GRPlatform current directoriesIn: aDirectoryPathString)
    do: [ :dirPathString | 
      Transcript show: ' MOFile from ' , dirPathString.
      self addMOFileFromPath: dirPathString forName: anApplicationName ]