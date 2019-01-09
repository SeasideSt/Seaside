mutual exclusion
terminateOwner
	self owner isNil ifFalse: [ GRPlatform current terminateProcess: self owner ]