tests-options
testUseScriptDataTypeWithAttrs
	self
		assert: (self ajax useScriptDataTypeWithAttrs: (Dictionary new at: 'nonce' put: 'abc123'; yourself))
		equals: self function, '.ajax({"dataType":"script","cache":false,"scriptAttrs":{"nonce":"abc123"}})'