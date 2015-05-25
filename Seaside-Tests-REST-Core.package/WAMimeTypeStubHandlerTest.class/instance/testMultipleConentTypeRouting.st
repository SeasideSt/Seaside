tests
testMultipleConentTypeRouting
	self assertContentType: 'foo/bar' accept: nil routesTo: #processTwo.
	self assertContentType: 'zork/fnord' accept: nil routesTo: #processTwo