testing
adaptorIsRunning

	^ self selectedAdaptor
		ifNil: [false]
		ifNotNil: [:adaptor | adaptor isRunning]
	