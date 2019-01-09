accessing
information
	^ self selectedAdaptor ifNotNil: [:adaptor | self informationForAdaptor: adaptor] ifNil: ['']