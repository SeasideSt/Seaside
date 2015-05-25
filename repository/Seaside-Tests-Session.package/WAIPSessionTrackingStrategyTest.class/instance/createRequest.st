private
createRequest
	^ super createRequest
		setRemoteAddress: self remoteAddress;
		yourself