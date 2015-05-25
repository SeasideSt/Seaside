tests
testSlash
	url host: 'seaside.st'.
	self assert: (url
			slash: true;
			greaseString) = 'http://seaside.st/'.
	self assert: (url
			slash: false;
			greaseString) = 'http://seaside.st/'.
	url addToPath: 'foo'.
	self assert: (url
			slash: true;
			greaseString) = 'http://seaside.st/foo/'.
	self assert: (url
			slash: false;
			greaseString) = 'http://seaside.st/foo'