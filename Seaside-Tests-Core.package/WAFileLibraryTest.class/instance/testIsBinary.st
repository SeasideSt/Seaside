tests
testIsBinary
	self deny: (WAFileLibrary isBinary: 'scipt.js').
	self deny: (WAFileLibrary isBinary: 'markup.xml').
	self deny: (WAFileLibrary isBinary: 'markup.xhtml').
	self deny: (WAFileLibrary isBinary: 'markup.html').
	self deny: (WAFileLibrary isBinary: 'file.txt').
	self deny: (WAFileLibrary isBinary: 'calendar.ics').
	self assert: (WAFileLibrary isBinary: 'image.jpeg').
	self assert: (WAFileLibrary isBinary:  'squeak.exe')