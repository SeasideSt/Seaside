tests
testFilenames
	| filenames |
	filenames := WATestingFiles default filenames.
	self assert: filenames size = 2.
	self assert: (filenames includes: 'sample.png').
	self assert: (filenames includes: 'sample.js')