running
run

	[ znWebSocket runWith: [ :message | self touchSession. onMessage value: message ] ]
		on: ConnectionClosed
		do: [ :e | onClose ifNotNil:[ onClose cull: e ] ]