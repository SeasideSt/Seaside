private
asFileAndFoldername: aSelector
	| foldername filename pathSeparator |
	pathSeparator := GRPlatform current pathSeparator.
	filename := (self fileResourceOf: aSelector) filepath.
	filename := filename replaceAll: $/ with: pathSeparator first.
	foldername := (filename includes: $/)
		ifTrue: [ self name , pathSeparator, (filename copyUpToLast: pathSeparator first) ]
		ifFalse: [ self name ].
	^ Array with: foldername with: (GRPlatform current localNameOf: filename)