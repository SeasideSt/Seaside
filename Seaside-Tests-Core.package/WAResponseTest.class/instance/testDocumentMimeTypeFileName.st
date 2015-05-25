tests-documents
testDocumentMimeTypeFileName
	self response document: 'foo;bar;zork' mimeType: 'text/csv' fileName: 'table.csv'.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Disposition: attachment; filename="table.csv"' 'Content-Type: text/csv' 'Content-Length: 12' '' 'foo;bar;zork')