tests-css
testCssAtPut
	self
		assert: ((self jQuery: 'p') cssAt: 'border' put: '1px solid red')
		equals: self function , '("p").css("border","1px solid red")'