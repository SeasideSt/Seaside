tests
testActions
	self
		assert: ((self jQuery: 'img') resizable disable)
		equals: self function , '("img").resizable("disable")'.
	self
		assert: ((self jQuery: 'img') resizable enable)
		equals: self function , '("img").resizable("enable")'.
	self
		assert: ((self jQuery: 'img') resizable destroy)
		equals: self function , '("img").resizable("destroy")'
		