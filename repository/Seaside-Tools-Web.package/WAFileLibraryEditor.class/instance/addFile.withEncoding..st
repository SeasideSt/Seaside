actions
addFile: aFile withEncoding: aCodec
	aFile isNil ifTrue: [
		"in case no file was selected for uploading"
		^ self ].

	(aFile contentType isNil or: [ aFile contentType isBinary ])
		ifFalse: [ 
			(aCodec class == GRNullCodec)
				ifFalse: [ aFile contentType charset: aCodec name ] ].
		
	self library addFile: aFile