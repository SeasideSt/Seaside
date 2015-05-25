tests-attributes
testPropertyAtPut
	self
		assert: ((self jQuery: 'button:gt(1)') propertyAt: 'disabled' put: true)
		equals: self function , '("button:gt(1)").prop("disabled",true)'