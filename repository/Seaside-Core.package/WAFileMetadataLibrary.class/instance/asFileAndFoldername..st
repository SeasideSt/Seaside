private
asFileAndFoldername: aSelector
	| foldername filename pathSeparator |
	pathSeparator := GRPlatform current pathSeparator.
	filename := (self fileResourceOf: aSelector) filepath.
	"File resources in metadata libraries are always specified using the UNIX path separator convention"
	foldername := (filename includes: $/)
		ifTrue: [ 
			filename := filename copyReplaceAll: '/' with: pathSeparator.
			self name , pathSeparator, (filename copyUpToLast: pathSeparator first) ]
		ifFalse: [ self name ].
	^ Array with: foldername with: (GRPlatform current localNameOf: filename)