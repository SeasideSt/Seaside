private
convertMultipartFileField: aChunk
	^ (self fileClass fromChunk: aChunk)
		fileName: (self codec url decode: aChunk fileName);
		yourself