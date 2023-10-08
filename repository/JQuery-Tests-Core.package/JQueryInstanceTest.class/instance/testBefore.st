tests-modifying
testBefore
	self
		assert: ((self jQuery: 'p') before: [ :html | html strong: 'Hello' ])
		equals: self function , '("p").before("<strong>Hello<\/strong>")'.
	self
		assert: ((self jQuery: 'span') insertBefore: '#foo')
		equals: self function , '("span").insertBefore("#foo")'