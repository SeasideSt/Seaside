testing
testSwaggerSpecificationFile
	| file |
	file := handler getSwaggerSpecificationFile.
	self assert: file = self expectedConfigurationFile