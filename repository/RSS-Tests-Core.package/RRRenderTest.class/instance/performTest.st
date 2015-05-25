running
performTest
	| context |
	context := WARequestContext 
		request: nil
		response: nil
		codec: GRNullCodec new.
	WACurrentRequestContext 
		use: context
		during: [ super performTest ]