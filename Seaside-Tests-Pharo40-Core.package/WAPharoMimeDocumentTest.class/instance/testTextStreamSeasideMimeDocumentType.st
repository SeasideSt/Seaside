tests
testTextStreamSeasideMimeDocumentType
	| document csv |
	csv := WAMimeType main: 'text' sub: 'csv'.
	document := 'foo,bar' readStream seasideMimeDocumentType: csv.
	self assert: document mimeType = csv.
	self assert: document contents = 'foo,bar'