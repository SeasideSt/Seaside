actions
removeAdaptor: anAdaptor
	anAdaptor isStopped ifTrue:[anAdaptor unregister].
	self initializeAdaptors