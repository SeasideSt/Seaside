actions
browseRequestHandler
	<button: 'Browse' enabled: true help: 'Browse the request handler'>
	<menuItem: 'Browse' enabled: #hasSelectedAdaptor priority: 200 help: 'Browse the request handler of this adaptor'>
	self selectedAdaptor
		ifNil: [WARequestHandlerBrowser open]
		ifNotNil: [:a | 
			WARequestHandlerBrowser new
				dispatcher: a requestHandler;
				open].