initialization
startUp
	self shutDown.
	process := GRPlatform current cometForkProcessDo: [ [ self pingProcess ] repeat ]