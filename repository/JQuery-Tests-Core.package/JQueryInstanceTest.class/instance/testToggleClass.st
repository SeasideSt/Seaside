tests-classes
testToggleClass
	self
		assert: ((self jQuery: 'p') toggleClass: 'highlight')
		equals: self function , '("p").toggleClass("highlight")'.
	self
		assert: ((self jQuery: 'p') toggleClass: 'highlight' state: true)
		equals: self function , '("p").toggleClass("highlight",true)'