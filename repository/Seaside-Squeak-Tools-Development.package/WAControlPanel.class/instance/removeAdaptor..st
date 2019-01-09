actions
removeAdaptor: aWAServerAdaptor

	aWAServerAdaptor isRunning ifFalse: [
		aWAServerAdaptor unregister].