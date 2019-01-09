testing
adaptorIsStopped

	^ self selectedAdaptor
		ifNil: [false]
		ifNotNil: [:adaptor | adaptor isStopped]
	