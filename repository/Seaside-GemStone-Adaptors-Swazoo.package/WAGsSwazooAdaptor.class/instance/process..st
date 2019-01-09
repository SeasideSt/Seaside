processing
process: aNativeRequest
	
	^GRPlatform current 
		seasideProcessRequest: aNativeRequest 
		adaptor: self
		resultBlock: [:aRequest | super process: aRequest ]