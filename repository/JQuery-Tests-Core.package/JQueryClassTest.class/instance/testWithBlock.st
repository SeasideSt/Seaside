tests-with
testWithBlock
	self
		assert: (self jQuery: [ :html | html heading: 'jQuery' ])
		equals: self function , '("<h1>jQuery<\/h1>")'