private
createRequest
	^ super createRequest
		setSslSessionId: self sslSessionId;
		yourself