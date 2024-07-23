callbacks
send: aString

	self isConnected ifFalse: [ ^ self ].
	self touchSession.
	znWebSocket sendMessage: aString