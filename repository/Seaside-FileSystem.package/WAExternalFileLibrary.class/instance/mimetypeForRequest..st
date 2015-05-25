private
mimetypeForRequest: aRequest
	| path |
	path := aRequest url path.
	^(path isEmpty or: [ (path last includes: $.) not ])
		ifTrue: [ WAFileLibrary defaultMimeType seasideMimeType ]
		ifFalse: [
			| extension |
			extension := path last copyAfterLast: $..
			WAFileLibrary mimetypeFor: extension ]