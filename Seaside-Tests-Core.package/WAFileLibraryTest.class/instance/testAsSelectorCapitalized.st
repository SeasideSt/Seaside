tests
testAsSelectorCapitalized
	| library |
	library := WATestingFiles default.
	self assert: (library asSelector: 'COMMENTS.TXT') = #COMMENTSTxt.
	self assert: (library asFilename: #COMMENTSTxt) = 'COMMENTS.txt'