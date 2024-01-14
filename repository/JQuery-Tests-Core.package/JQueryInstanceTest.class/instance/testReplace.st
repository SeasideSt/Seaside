tests-modifying
testReplace
	self
		assert: ((self jQuery: 'p') replaceWith: [ :html | html emphasis: 'Hello' ])
		equals: self function , '("p").replaceWith("<em>Hello<\/em>")'.
	self
		assert: ((self jQuery html: [ :html | html div: 'Hello' ]) replaceAll: '.foo')
		equals: self function , '("<div>Hello<\/div>").replaceAll(".foo")'