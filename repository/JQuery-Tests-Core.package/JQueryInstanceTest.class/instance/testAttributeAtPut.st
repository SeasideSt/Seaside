tests-attributes
testAttributeAtPut
	self
		assert: ((self jQuery: 'button:gt(1)') attributeAt: 'disabled' put: true)
		equals: self function , '("button:gt(1)").attr("disabled",true)'