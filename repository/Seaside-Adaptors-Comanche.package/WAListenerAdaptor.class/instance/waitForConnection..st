private
waitForConnection: aSocket
	| socket stream |
	socket := aSocket waitForAcceptFor: 10.
	socket isNil ifTrue: [ ^ self ].
	stream := SocketStream on: socket.
	[ [ [ self process: stream ]
		ensure: [ stream close ] ]
			ifCurtailed: [ socket destroy ] ]
				forkAt: Processor userBackgroundPriority