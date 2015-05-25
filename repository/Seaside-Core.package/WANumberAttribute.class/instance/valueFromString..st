converting
valueFromString: aString
	^ aString isEmptyOrNil ifFalse: [ Number readFrom: aString readStream ]