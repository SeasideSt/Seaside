control
startGemServer: serverName On: portInteger
	"use this method to start adaptor in a separate gem.
	 use #startOn: if starting from development vm"

	GRPlatform current seasideLogServerStart: serverName port: portInteger.
	"The method not expected to return"
	self startServer: serverName On: portInteger