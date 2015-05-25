tests
testSimpleConentTypeRouting
	self assertContentType: 'application/xml' accept: nil routesTo: #processApplicationXml.
	self assertContentType: 'text/xml' accept: nil routesTo: #processXml