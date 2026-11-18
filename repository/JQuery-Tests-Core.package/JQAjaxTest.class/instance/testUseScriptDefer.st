tests-options
testUseScriptDefer
	self
		assert: (self ajax useScriptDefer: true)
		equals: self function, '.ajax({"dataType":"script","cache":false,"scriptAttrs":{"defer":true}})'