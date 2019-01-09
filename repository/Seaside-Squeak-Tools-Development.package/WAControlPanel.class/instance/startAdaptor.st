actions
startAdaptor
	<button: 'Start' enabled: #adaptorIsStopped help: 'Start the current adaptor to listen for requests'>
	<menuItem: 'Start adaptor' enabled: #adaptorIsStopped priority: 500 help: 'Start the current adaptor to listen for requests'>
	self selectedAdaptor ifNotNil: [:adaptor |
		self updateAfter: [adaptor start]].