accessing
mimetypeForFile: aFilename
	^ self class mimetypeFor: (aFilename copyAfterLast: $.)