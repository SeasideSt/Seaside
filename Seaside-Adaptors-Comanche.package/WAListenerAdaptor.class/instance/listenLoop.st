private
listenLoop
	| socket |
	socket := Socket newTCP.
	socket 
		listenOn: port
		backlogSize: 50.
	socket isValid ifFalse: [ self error: 'Cannot listen on port ' , port greaseString ].
	
	[ 
	[ socket isValid ifFalse: [ ^ self listenLoop ].
	self waitForConnection: socket ] repeat ] ifCurtailed: 
		[ (Delay forMilliseconds: 10) wait.
		socket destroy ]