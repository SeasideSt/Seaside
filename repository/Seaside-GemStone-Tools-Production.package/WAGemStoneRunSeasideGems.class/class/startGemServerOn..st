control
startGemServerOn: portInteger
	"use this method to start adaptor in a separate gem.
	 use #startOn: if starting from development vm"

	| default |
	default := self default.
	GRPlatform current seasideLogServerStart: default name port: portInteger.
	"The method not expected to return"
	self default startOn: portInteger