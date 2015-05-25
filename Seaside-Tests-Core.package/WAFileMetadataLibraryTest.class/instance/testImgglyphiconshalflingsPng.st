tests
testImgglyphiconshalflingsPng
	| handler library response stream contents |
	handler := WAFileHandler new.
	library := WATestingMetadataFileLibrary default.
	self requestContextWithUrl: '/i/dont/care/WATestingMetadataFileLibrary/img/glyphicons-halflings.png'.
	requestContext consumer next; next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assert: response status = 200.
	self assert: response contentType = WAMimeType imagePng.
	stream := WriteStream on: ByteArray new.
	response writeContentOn: stream.
	contents := stream contents.
	self assert: contents asByteArray = (library perform: #imgglyphiconshalflingsPng) contents value
