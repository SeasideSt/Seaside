tests-options
testUseScriptTagCharset
	self
		assert: (self ajax useScriptTagCharset: 'utf-8')
		equals: self function, '.ajax({"dataType":"script","cache":false,"scriptAttrs":{"charset":"utf-8"}})'