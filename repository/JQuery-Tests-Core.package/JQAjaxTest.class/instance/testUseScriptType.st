tests-options
testUseScriptType
	self
		assert: (self ajax useScriptType: 'module')
		equals: self function, '.ajax({"dataType":"script","cache":false,"scriptAttrs":{"type":"module"}})'