tests-options
testUseScriptNonce
	self
		assert: (self ajax useScriptNonce: 'abc123')
		equals: self function, '.ajax({"dataType":"script","cache":false,"scriptAttrs":{"nonce":"abc123"}})'