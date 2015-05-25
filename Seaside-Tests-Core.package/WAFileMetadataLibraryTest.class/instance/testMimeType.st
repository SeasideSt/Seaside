tests
testMimeType
	| library |
	library := WATestingMetadataFileLibrary default.
	self assert: (library mimetypeOf: #imgglyphiconshalflingsPng) = WAMimeType imagePng.
	self assert: (library mimetypeOf: #jsbootstrapJs) =  'application/x-javascript' seasideMimeType