attributes
name: aString
	"This attribute names the current anchor so that it may be the destination of another link. The value of this attribute must be a unique anchor name. The scope of this name is the current document. Note that this attribute shares the same name space as the id attribute."
	self
		greaseDeprecatedApi: 'WAAnchorTag>>name:'
		details: 'Use the id attribute instead. https://www.geeksforgeeks.org/what-are-the-html-tags-that-deprecated-in-html5/'.	
	self attributes at: 'name' put: aString