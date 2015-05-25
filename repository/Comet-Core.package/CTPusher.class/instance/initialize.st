initialization
initialize
	super initialize.
	mutex := GRPlatform current semaphoreClass forMutualExclusion.
	handlers := Array new