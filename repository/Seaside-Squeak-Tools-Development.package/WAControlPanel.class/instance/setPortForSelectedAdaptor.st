actions
setPortForSelectedAdaptor
	<menuItem: 'Set adapor port...' enabled: #adaptorIsStopped priority: 500 help: 'Change the port for the current adaptor'>
	self selectedAdaptor ifNotNil: [:adaptor |
		self updateAfter: [self setPortFor: adaptor]].