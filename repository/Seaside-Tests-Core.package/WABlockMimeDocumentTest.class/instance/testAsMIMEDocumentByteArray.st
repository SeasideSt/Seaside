tests
testAsMIMEDocumentByteArray
	| document content |
	document := WABlockMimeDocument onBlock: [ #(1 2 3 4) asByteArray ].
	self assert: document contentType = WAMimeType applicationOctetStream.
	content := document content.
	self assert: content size = 4.
	self assert: content class = ByteArray.
	1 to: 4 do: [ :index | self assert: (content at: index) = index ]