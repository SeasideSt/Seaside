testing
testSwaggerSpecificationFile
	| file |
	file := handler getSwaggerSpecificationFile.
	self assert: (GRPlatform current jsonParserClass parse: file) equals: (GRPlatform current jsonParserClass parse: self expectedConfigurationFile)