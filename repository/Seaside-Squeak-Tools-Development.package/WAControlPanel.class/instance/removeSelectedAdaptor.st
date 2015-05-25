actions
removeSelectedAdaptor
	<menuItem: 'Remove' enabled: #hasSelectedAdaptor priority: 300 help: 'Remove the current adaptor'>
	self selectedAdaptor ifNotNil: [:adaptor |
		self updateAfter: [self removeAdaptor: adaptor]].