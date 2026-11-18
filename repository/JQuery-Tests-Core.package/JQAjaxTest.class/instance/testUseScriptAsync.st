tests-options
testUseScriptAsync
	self
		assert: (self ajax useScriptAsync: true)
		equals: self function, '.ajax({"dataType":"script","cache":false,"scriptAttrs":{"async":true}})'