file addition
recursivelyAddAllFilesIn: aPathString relativeToRootDirectory: relativeRootDirectory
	(GRPlatform current directoriesIn: aPathString) do: [ :each | 
		self recursivelyAddAllFilesIn: each relativeToRootDirectory: relativeRootDirectory ].
	(GRPlatform current filesIn: aPathString) do: [ :each | 
		self addFileAt: each relativeToRootDirectory: relativeRootDirectory ]