tests
testFilenames
	| filenames |
	filenames := WATestingMetadataFileLibrary default filenames.
	self assert: filenames size = 3.
	self assert: (filenames includes: 'img/glyphicons-halflings.png').
	self assert: (filenames includes: 'js/bootstrap.js').
	self assert: (filenames includes: 'main.css')