initialization
initialize

	super initialize.
	mutex := GRPlatform current semaphoreClass forMutualExclusion.
	sockets := OrderedCollection new.
	id := WAKeyGenerator current keyOfLength: 16