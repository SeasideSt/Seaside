mutual exclusion
terminateOwner
	owner isNil ifFalse: [ GRPlatform current terminateProcess: owner ]