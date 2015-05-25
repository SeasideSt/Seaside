tests
testPost
	self
		assert: (self jQuery post)
		equals: self function , '.post("/")'.
	self
		assert: (self jQuery post addParameter: 'foo')
		equals: self function , '.post("/","foo")'.
	self
		assert: (self jQuery post addParameter: 'foo' -> true)
		equals: self function , '.post("/","foo="+encodeURIComponent(true))'