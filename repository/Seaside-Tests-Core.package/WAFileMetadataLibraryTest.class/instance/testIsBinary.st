tests
testIsBinary
	self deny: (WAFileMetadataLibrary isBinary: 'scipt.js').
	self deny: (WAFileMetadataLibrary isBinary: 'markup.xml').
	self deny: (WAFileMetadataLibrary isBinary: 'markup.xhtml').
	self deny: (WAFileMetadataLibrary isBinary: 'markup.html').
	self deny: (WAFileMetadataLibrary isBinary: 'file.txt').
	self deny: (WAFileMetadataLibrary isBinary: 'calendar.ics').
	self assert: (WAFileMetadataLibrary isBinary: 'image.jpeg').
	self assert: (WAFileMetadataLibrary isBinary:  'squeak.exe')