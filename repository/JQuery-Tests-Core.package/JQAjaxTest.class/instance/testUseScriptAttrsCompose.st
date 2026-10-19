tests-options
testUseScriptAttrsCompose
	self
		assert: ((self ajax useScriptNonce: 'abc123') useScriptIntegrity: 'sha256-xyz')
		equals: self function, '.ajax({"dataType":"script","cache":false,"scriptAttrs":{"nonce":"abc123","integrity":"sha256-xyz"}})'