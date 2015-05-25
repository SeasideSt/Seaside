tests
testStringSeasideMimeDocumentType
	| document csv |
	csv := WAMimeType main: 'text' sub: 'csv'.
	document := 'foo,bar' seasideMimeDocumentType: csv.
	self assert: document mimeType = csv.
	self assert: document contents = 'foo,bar'