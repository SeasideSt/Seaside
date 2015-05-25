tests-attributes
testPropertyAt
	self
		assert: ((self jQuery: 'em') propertyAt: 'title')
		equals: self function , '("em").prop("title")'