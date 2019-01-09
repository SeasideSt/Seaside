actions
inspectAdaptor
	<menuItem: 'Inspect adaptor' enabled: #hasSelectedAdaptor priority: 500 help: 'Inspect the current adatpor'>
	self selectedAdaptor
		ifNotNil: [:a | a inspect].