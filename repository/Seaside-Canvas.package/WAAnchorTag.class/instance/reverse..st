attributes
reverse: aString
	"This attribute is used to describe a reverse link from the anchor specified by the href attribute to the current document. The value of this attribute is a space-separated list of link types."
	
	self attributes at: 'rev' append: aString