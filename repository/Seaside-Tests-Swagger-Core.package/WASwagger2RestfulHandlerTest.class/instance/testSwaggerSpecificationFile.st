testing
testSwaggerSpecificationFile
	| file |
	file := handler getSwaggerSpecificationFile.
	self assert: (WAJsonParser parse: file) equals: (WAJsonParser parse: self expectedConfigurationFile)