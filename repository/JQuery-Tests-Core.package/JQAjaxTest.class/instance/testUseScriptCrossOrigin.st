tests-options
testUseScriptCrossOrigin
	self
		assert: (self ajax useScriptCrossOrigin: 'anonymous')
		equals: self function, '.ajax({"dataType":"script","cache":false,"scriptAttrs":{"crossorigin":"anonymous"}})'