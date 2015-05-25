private
absolutePathFromRelative: aRelativeFilePath
	| allFiles absoluteFile filePart |
	allFiles := GRPlatform current filesIn: aRelativeFilePath.
	allFiles isEmpty ifTrue: [
		allFiles := GRPlatform current directoriesIn: aRelativeFilePath ].
	
	absoluteFile := allFiles first.
	filePart := GRPlatform current localNameOf: absoluteFile.
	
	^ absoluteFile allButLast: filePart size
	
	