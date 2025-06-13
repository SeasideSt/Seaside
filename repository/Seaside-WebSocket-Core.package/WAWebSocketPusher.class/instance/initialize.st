initialization
initialize
	super initialize.
	mutex := GRPlatform current semaphoreClass forMutualExclusion.
	sockets := Array new.
	id := WAKeyGenerator current keyOfLength: 16.