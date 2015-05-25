actions
setEncodingForSelectedAdaptor
	<menuItem: 'Set adapor encoding...' enabled: #hasSelectedAdaptor priority: 500 help: 'Change the encoder for the current adaptor'>
	self selectedAdaptor ifNotNil: [:adaptor |
		self updateAfter: [self setEncodingFor: adaptor]].