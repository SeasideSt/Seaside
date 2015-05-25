copying
withField: aString value: valueString
	^ self copy
		addField: aString value: valueString;
		yourself