actions
removeFile: aFilename 
	GRPlatform current 
		removeSelector: (self asSelector: aFilename)
		from: self class