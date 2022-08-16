accessing
addSocket: aWebSocket
	mutex critical: [ sockets := sockets copyWith: aWebSocket ]