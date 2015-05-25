tests-documents
testDocumentMimeType
	self response document: 'alert("Seaside")' mimeType: 'text/javascript'.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Type: text/javascript' 'Content-Length: 16' '' 'alert("Seaside")')