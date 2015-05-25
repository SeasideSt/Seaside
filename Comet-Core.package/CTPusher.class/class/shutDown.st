initialization
shutDown
	process ifNil: [ ^ self ].
	GRPlatform current terminateProcess: process.
	process := nil