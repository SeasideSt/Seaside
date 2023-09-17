attributes
scheme: aString
	self
		greaseDeprecatedApi: 'WAMetaElement>>scheme:'
		details: 'Use only one scheme per field, or make the scheme declaration part of the value. https://www.geeksforgeeks.org/what-are-the-html-tags-that-deprecated-in-html5/'.	
	self attributeAt: 'scheme' put: aString