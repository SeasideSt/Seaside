tests-options
testIfModified
	self
		assert: (self ajax ifModified: false)
		equals: self function , '.ajax({"ifModified":false})'