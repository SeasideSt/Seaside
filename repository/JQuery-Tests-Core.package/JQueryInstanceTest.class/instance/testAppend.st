tests-modifying
testAppend
	self
		assert: ((self jQuery: 'p') append: [ :html | html strong: 'Hello' ])
		equals: self function , '("p").append("<strong>Hello<\/strong>")'.
	self
		assert: ((self jQuery: 'span') appendTo: '#foo')
		equals: self function , '("span").appendTo("#foo")'