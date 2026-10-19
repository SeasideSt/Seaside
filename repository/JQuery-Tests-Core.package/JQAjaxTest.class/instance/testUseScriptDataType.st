tests-options
testUseScriptDataType
	self
		assert: self ajax useScriptDataType
		equals: self function, '.ajax({"dataType":"script","cache":false})'