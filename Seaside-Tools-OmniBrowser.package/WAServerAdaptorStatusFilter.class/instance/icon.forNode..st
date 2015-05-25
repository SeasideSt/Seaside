filtering
icon: aSymbol forNode: aNode
	aNode isStopped ifTrue: [ ^ #seasideAdaptorStopped ].
	aNode isRunning ifTrue: [ ^ #seasideAdaptorRunning ].
	^ #blank