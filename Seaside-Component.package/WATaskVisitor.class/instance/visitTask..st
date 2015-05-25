visiting
visitTask: aTask
	super visitTask: aTask.
	aTask isExecuting ifFalse: [
		[ aTask execute ]
			on: WARenderNotification
			do: [ :n | ] ]