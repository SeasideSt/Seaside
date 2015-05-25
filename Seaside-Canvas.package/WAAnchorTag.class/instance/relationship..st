attributes
relationship: aString
	"This attribute describes the relationship from the current document to the anchor specified by the href attribute. The value of this attribute is a space-separated list of link types."
	
	self attributes at: 'rel' append: aString