accessing
filenames
	^ self fileSelectors collect: [ :each | self asFilename: each ]