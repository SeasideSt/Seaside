tests
testBinaryFileUpload
	| converter role request  paramsDictionary stdin waFile x y |
	converter := WAFastCGIAdaptor new.
	converter codec: GRUtf8GemStoneCodec new.
	stdin := self binaryFileByteArray.
	paramsDictionary := Dictionary new.
	paramsDictionary 
		at: 'REQUEST_URI' 
			put: '/tests/functional/WAUploadFunctionalTest?_s=htl2tWqpZgfN2Zb9&_k=rFiavdVrO1ViRzoD';
		at: 'REQUEST_METHOD'
			put: 'POST';
		at: 'CONTENT_TYPE'
			put: 'multipart/form-data; boundary=----WebKitFormBoundaryPlIcHP7dkpjoZ17w';
		at: 'CONTENT_LENGTH'
			put: stdin size printString;
		at: 'SERVER_PROTOCOL'
			put: 'HTTP/1.1';
		at: 'REMOTE_ADDR'
			put: '10.80.250.51'.
	role := FSResponderRole new
		stdin: stdin
		params: paramsDictionary.
	request := converter requestFor: role.
	self assert: request isPost.
	self assert: request rawBody = stdin.
	waFile := request postFields at: '4'.
	self assert: waFile contentType = WAMimeType imagePng.
	self assert: waFile fileName = 'findmenu.png'.
	self assert: (x := waFile rawContents) = (y := self binaryFileContents).