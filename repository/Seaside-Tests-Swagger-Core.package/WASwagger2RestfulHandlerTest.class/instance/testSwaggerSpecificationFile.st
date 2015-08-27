testing
testSwaggerSpecificationFile
	| file |
	file := handler getSwaggerSpecificationFile.
	self assert: file equals: self expectedConfigurationFile