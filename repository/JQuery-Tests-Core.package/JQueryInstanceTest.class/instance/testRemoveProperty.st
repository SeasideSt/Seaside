tests-attributes
testRemoveProperty
	self
		assert: ((self jQuery: 'button') removeProperty: 'disabled')
		equals: self function , '("button").removeProp("disabled")'