instructions
send: aString
	znWebSocket isConnected ifTrue:[
		znWebSocket sendMessage: aString ]