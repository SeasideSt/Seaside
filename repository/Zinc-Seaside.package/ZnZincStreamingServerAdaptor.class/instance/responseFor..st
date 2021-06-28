converting
responseFor: aZnRequest
	^ WAComboResponse
		onStream: aZnRequest stream
		bufferSize: 4096
		codec: self codec