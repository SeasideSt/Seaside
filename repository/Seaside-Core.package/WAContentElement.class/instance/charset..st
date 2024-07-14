attributes
charset: aString
	self
		greaseDeprecatedApi: 'WAContentElement>>charset:'
		details: 'Use an HTTP Content-Type header on the linked resource instead. https://www.geeksforgeeks.org/what-are-the-html-tags-that-deprecated-in-html5/'.	
	self attributeAt: 'charset' put: aString