tests
testSimpleAcceptRouting
	self assertContentType: nil accept: 'image/jpeg;q=0.8,image/png' routesTo: #producePng.
	self assertContentType: nil accept: 'image/jpeg;q=0.8,image/png;q=0.9' routesTo: #producePng.
	self assertContentType: nil accept: 'image/png,image/jpeg;q=0.8' routesTo: #producePng.
	self assertContentType: nil accept: 'image/png;q=0.9,image/jpeg;q=0.8' routesTo: #producePng.
	
	self assertContentType: '1/1' accept: 'image/png' routesTo: #producePng.
	self assertContentType: '1/1' accept: 'image/png' routesTo: #producePng