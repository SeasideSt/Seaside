tests-modifying
testAfter
	self
		assert: ((self jQuery: 'p') after: [ :html | html strong: 'Hello' ])
		equals: self function , '("p").after("<strong>Hello<\/strong>")'.
	self
		assert: ((self jQuery: 'span') insertAfter: '#foo')
		equals: self function , '("span").insertAfter("#foo")'