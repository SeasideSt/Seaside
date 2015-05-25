private
addFileAt: aPath relativeToRootDirectory: relativeRootDirectory
	| relativeFilepath pathSeparator |
	relativeFilepath := aPath allButFirst: relativeRootDirectory size.
	pathSeparator := GRPlatform current pathSeparator.
	
	(relativeFilepath first = pathSeparator first) 
		ifTrue: [ relativeFilepath := relativeFilepath allButFirst ].
		
	relativeFilepath := relativeFilepath replaceAll: pathSeparator first with: $/. 

	self addFileNamed: relativeFilepath
		contents: (GRPlatform current 
				contentsOfFile: aPath
				binary: (self isBinaryAt: aPath))