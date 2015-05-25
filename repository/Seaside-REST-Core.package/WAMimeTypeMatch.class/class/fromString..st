instance creation
fromString: aString
	^ self fromMimeType: (WAMimeType fromString: aString)