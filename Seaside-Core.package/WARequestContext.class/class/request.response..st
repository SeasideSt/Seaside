instance creation
request: aRequest response: aResponse
	^ self 
		request: aRequest
		response: aResponse
		codec: GRNullCodec new