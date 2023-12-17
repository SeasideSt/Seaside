tests-manipulating
testHtml
	self 
		assert: (((self jQuery: 'div')) html)
		equals: self function , '("div").html()'.
	self 
		assert: ((self jQuery: 'div') html: [ :html | html div ])
		equals: self function , '("div").html("<div><\/div>")'