private
createServer

	^(FSGsSocketServer onRequestHandler: self)
		port: self port;
		yourself.