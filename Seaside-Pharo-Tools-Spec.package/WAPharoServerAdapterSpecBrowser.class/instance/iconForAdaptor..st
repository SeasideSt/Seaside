private - accessing
iconForAdaptor: anAdaptor

	^ anAdaptor isRunning 
		ifTrue:[Smalltalk ui icons iconNamed: #seasideAdaptorRunningIcon] 
		ifFalse:[Smalltalk ui icons iconNamed: #seasideAdaptorStoppedIcon ]