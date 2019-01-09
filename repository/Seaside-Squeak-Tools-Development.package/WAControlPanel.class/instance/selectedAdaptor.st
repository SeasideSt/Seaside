accessing
selectedAdaptor
	^ self adaptorAt: self adaptorsListIndex ifAbsent: [nil]