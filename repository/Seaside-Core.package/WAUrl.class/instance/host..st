accessing
host: aString
	host := aString isNil
		ifFalse: [ aString greaseString asLowercase ]