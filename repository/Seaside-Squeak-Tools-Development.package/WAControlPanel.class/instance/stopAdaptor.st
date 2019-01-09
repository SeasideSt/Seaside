actions
stopAdaptor
	<button: 'Stop' enabled: #adaptorIsRunning help: 'Stop the current adaptor'>
	<menuItem: 'Stop adaptor' enabled: #adaptorIsRunning priority: 500 help: 'Stop the current adaptor'>
	self selectedAdaptor ifNotNil: [:adaptor |
		self updateAfter: [adaptor stop]].