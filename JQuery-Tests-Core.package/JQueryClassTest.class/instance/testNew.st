tests-creation
testNew
	self
		assert: (self jQuery new)
		equals: self function , '(this)'.
	self
		assert: (self jQuery new id: 'foo')
		equals: self function , '("#foo")'