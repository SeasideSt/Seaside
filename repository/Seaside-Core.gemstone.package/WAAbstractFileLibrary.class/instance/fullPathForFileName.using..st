private
fullPathForFileName: aString using: aFileHandler
	^ String streamContents: [ :stream |
		| pathSeparator xSendfileBaseDirectory |
		pathSeparator := GRPlatform current pathSeparator.
		xSendfileBaseDirectory := aFileHandler xSendfileBaseDirectory.
		stream nextPutAll: xSendfileBaseDirectory.
		(xSendfileBaseDirectory endsWithSubCollection: pathSeparator) ifFalse: [
			stream nextPutAll: pathSeparator ].
		stream
			nextPutAll: self name;
			nextPutAll: pathSeparator;
			nextPutAll: aString ]