tests-attributes
testAttributeAt
	self
		assert: ((self jQuery: 'em') attributeAt: 'title')
		equals: self function , '("em").attr("title")'