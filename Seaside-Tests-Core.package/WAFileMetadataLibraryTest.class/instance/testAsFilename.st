tests
testAsFilename
	| library |
	library := WATestingMetadataFileLibrary default.
	self assert: (library asFilename: #imgglyphiconshalflingsPng) ='img/glyphicons-halflings.png'.
	self assert: (library asFilename: #jsbootstrapJs) =  'js/bootstrap.js'