tests-options
testUseScriptNoModule
	self
		assert: (self ajax useScriptNoModule: true)
		equals: self function, '.ajax({"dataType":"script","cache":false,"scriptAttrs":{"nomodule":true}})'