private
removeSocket: aWebSocket
	mutex critical: [
		sockets remove: aWebSocket ifAbsent: [ ] ]