accessing
iconForAdaptor: anAdaptor
	^ self iconNamed: (anAdaptor isRunning ifTrue: [ #adaptorRunningIcon ] ifFalse: [ #adaptorStoppedIcon ])