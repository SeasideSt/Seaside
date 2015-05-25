converting
valueFromString: aString 
	^ aString isEmptyOrNil ifFalse: [ GRPlatform current secureHashFor: aString ]