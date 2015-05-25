processing
performAction
	self withNotificationHandlerDo: [ self basicPerformAction ].
	self startTasks