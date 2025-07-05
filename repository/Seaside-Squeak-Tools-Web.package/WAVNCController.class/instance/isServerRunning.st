testing
isServerRunning
	^ self serverInstance
		 ifNil: [ false ]
		 ifNotNil: [ :srv| srv isRunning ]