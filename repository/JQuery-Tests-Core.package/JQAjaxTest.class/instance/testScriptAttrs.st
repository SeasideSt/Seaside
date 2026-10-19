tests-options
testScriptAttrs
	self
		assert: (self ajax scriptAttrs: 'nonce')
		equals: self function, '.ajax({"scriptAttrs":"nonce"})'