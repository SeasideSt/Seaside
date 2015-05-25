accessing
scheme: aString
	scheme := aString isNil ifFalse: [ aString asLowercase ]