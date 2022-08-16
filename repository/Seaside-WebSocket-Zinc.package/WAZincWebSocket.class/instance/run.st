running
run

	[ znWebSocket runWith: [ :message | onMessage value: message ] ]
		on: ConnectionClosed
		do: [ :e | onClose ifNotNil:[ onClose cull: e ] ]