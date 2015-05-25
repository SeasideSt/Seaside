handlers
handlersOfDispatcher: aWADispatcher

	^ aWADispatcher isDispatcher
		ifTrue: [aWADispatcher handlers]
		ifFalse: [#()]