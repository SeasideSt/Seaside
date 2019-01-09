actions
newVersion: aWorkingCopy
	| version stream |
	version := [ aWorkingCopy newVersion ]
		on: MCVersionNameAndMessageRequest
		do: [ :request | request resume: (Array with: request suggestedName with: '') ].
	stream := RWBinaryOrTextStream on: String new.
	version fileOutOn: stream.
	self requestContext respond: [ :response |
		response
			contentType: WAMimeType applicationOctetStream;
			attachmentWithFileName: version fileName;
			nextPutAll: stream contents ]