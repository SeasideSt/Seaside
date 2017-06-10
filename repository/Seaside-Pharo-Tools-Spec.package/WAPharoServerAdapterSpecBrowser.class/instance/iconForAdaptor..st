private - accessing
iconForAdaptor: anAdaptor

	^ anAdaptor isRunning 
		ifTrue: [ Smalltalk ui icons seasideAdaptorRunningIcon ] 
		ifFalse: [ Smalltalk ui icons seasideAdaptorStoppedIcon ]