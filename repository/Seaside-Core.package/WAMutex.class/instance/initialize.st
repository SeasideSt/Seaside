initialization
initialize
	super initialize.
	semaphore := GRPlatform current semaphoreClass forMutualExclusion.
	owner := GRPlatform current newTransientValueHolder