tests
testActions
	self
		assert: ((self jQuery: 'img') accordion option:'active' put: 3)
		equals: self function , '("img").accordion("option","active",3)'