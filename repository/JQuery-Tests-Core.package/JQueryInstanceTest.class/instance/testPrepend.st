tests-modifying
testPrepend
	self
		assert: ((self jQuery: 'p') prepend: [ :html | html strong: 'Hello' ])
		equals: self function , '("p").prepend("<strong>Hello<\/strong>")'.
	self
		assert: ((self jQuery: 'span') prependTo: '#foo')
		equals: self function , '("span").prependTo("#foo")'