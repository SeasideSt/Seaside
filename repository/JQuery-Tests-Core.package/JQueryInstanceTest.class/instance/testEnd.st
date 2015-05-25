tests-chaining
testEnd
	self
		assert: ((self jQuery: 'p') find: 'span'; addClass: 'border'; end; addClass: 'highlight')
		equals: self function , '("p").find("span").addClass("border").end().addClass("highlight")'