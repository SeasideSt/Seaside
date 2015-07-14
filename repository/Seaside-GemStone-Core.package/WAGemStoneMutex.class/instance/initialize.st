initialization
initialize
	super initialize.
	semaphore := GRPlatform current semaphoreClass forMutualExclusion.
	owner := TransientValue value: nil.