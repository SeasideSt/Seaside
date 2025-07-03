accessing
webSocket
	^ self properties at: #webSocket ifAbsent:[ nil ]