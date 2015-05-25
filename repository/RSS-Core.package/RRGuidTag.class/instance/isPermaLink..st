attributes
isPermaLink: aBoolean 
	"the value really must be a string else seaside makes
	isPermaLink='isPermaLink'"
	self 
		attributeAt: 'isPermaLink'
		put: aBoolean greaseString