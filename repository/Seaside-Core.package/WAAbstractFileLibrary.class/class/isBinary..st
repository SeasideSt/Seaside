private
isBinary: aFilename
	^ (self mimetypeFor: (aFilename copyAfterLast: $.)) isBinary