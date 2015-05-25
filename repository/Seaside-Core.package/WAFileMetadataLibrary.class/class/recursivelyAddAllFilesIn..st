file addition
recursivelyAddAllFilesIn: aPathString 
	"adds all files in the directory specified by aPathString to the current file library - 
	*does* recurse into sub-directories"
	| isAbsolutePath rootPath |
	isAbsolutePath := (aPathString first = GRPlatform current pathSeparator first).
	rootPath := isAbsolutePath 
		ifTrue: [ aPathString ]
		ifFalse: [ self absolutePathFromRelative: aPathString ].
		
	self recursivelyAddAllFilesIn: aPathString relativeToRootDirectory: rootPath