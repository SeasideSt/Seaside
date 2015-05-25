tests-options
testGlobal
	self
		assert: (self ajax global: false)
		equals: self function , '.ajax({"global":false})'