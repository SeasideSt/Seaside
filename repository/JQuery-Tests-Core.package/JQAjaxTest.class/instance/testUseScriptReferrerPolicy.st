tests-options
testUseScriptReferrerPolicy
	self
		assert: (self ajax useScriptReferrerPolicy: 'no-referrer')
		equals: self function, '.ajax({"dataType":"script","cache":false,"scriptAttrs":{"referrerpolicy":"no-referrer"}})'