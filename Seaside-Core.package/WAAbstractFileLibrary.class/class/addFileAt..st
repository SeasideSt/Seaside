file addition
addFileAt: aPath 
	"Add the file specified by aPath to the current file library."
	self 
		addFileAt: aPath
		contents: (GRPlatform current 
				contentsOfFile: aPath
				binary: (self isBinaryAt: aPath))