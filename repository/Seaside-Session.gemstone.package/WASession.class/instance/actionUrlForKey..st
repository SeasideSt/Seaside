accessing
actionUrlForKey: aString
	^ self url
		addField: self actionField value: aString;
		yourself