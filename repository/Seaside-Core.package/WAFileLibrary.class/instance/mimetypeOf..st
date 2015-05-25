accessing
mimetypeOf: aSelector
	^ self mimetypeForFile: (self asFilename: aSelector)