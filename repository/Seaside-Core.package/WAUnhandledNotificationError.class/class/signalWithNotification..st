signaling
signalWithNotification: aNotification
	^ self new
		notification: aNotification;
		signal