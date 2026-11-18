tests-options
testUseScriptFetchPriority
	self
		assert: (self ajax useScriptFetchPriority: 'high')
		equals: self function, '.ajax({"dataType":"script","cache":false,"scriptAttrs":{"fetchpriority":"high"}})'