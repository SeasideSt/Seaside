accessing
server
	"Return the ZnServer running me, create a default one if missing and confugure it."

	server
		ifNil: [ 
			server := self defaultZnServer.
			self
				configureDelegate;
				configureServerForBinaryReading ].
	^ server