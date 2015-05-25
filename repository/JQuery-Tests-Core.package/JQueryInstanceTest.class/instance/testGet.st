tests-accessors
testGet
	self
		assert: ((self jQuery: 'div') get)
		equals: self function , '("div").get()'.
	self
		assert: ((self jQuery: 'div') get: 1)
		equals: self function , '("div").get(1)'