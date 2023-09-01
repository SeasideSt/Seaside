actions
newVersion: aWorkingCopy
	| version stream |
	version := [ aWorkingCopy newVersionIn: aWorkingCopy repositoryGroup ]
		on: MCVersionNameAndMessageRequest
		do: [ :request | request resume: (Array with: request suggestedName with: '') ].
	stream := GRPlatform current readWriteByteStream.
	version fileOutOn: stream.
	self requestContext respond: [ :response |
		response
			contentType: WAMimeType applicationOctetStream;
			attachmentWithFileName: version fileName;
			nextPutAll: stream contents ]