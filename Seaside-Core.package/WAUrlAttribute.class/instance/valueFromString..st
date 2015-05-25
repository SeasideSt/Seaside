converting
valueFromString: aString
	^ aString isEmptyOrNil ifFalse: [ WAUrl absolute: aString ]