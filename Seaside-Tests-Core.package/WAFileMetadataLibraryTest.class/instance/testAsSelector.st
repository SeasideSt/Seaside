tests
testAsSelector
	self assert: (WAFileMetadataLibrary asSelector: 'js/bootstrap.js') = #jsbootstrapJs.
	self assert: (WAFileMetadataLibrary asSelector: 'img/glyphicons-halflings.png') = #imgglyphiconshalflingsPng.
	self assert: (WAFileMetadataLibrary asSelector: 'css/bootstrap-responsive.css') = #cssbootstrapresponsiveCss