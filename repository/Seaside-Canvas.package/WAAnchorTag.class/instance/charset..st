attributes
charset: aString
	"This attribute specifies the character encoding of the resource designated by the link."
	self
		greaseDeprecatedApi: 'WAAnchorTag>>charset:'
		details: 'Use an HTTP Content-Type header on the linked resource instead. https://www.geeksforgeeks.org/what-are-the-html-tags-that-deprecated-in-html5/'.	
	self attributes at: 'charset' put: aString