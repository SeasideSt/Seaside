tests-options
testUseScriptIntegrity
	self
		assert: (self ajax useScriptIntegrity: 'sha256-xyz')
		equals: self function, '.ajax({"dataType":"script","cache":false,"scriptAttrs":{"integrity":"sha256-xyz"}})'