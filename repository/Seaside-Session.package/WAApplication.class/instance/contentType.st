configuration
contentType
	^ self mimeType seasideMimeType
		charset: self requestContext charSet;
		yourself