mutual exclusion
terminateOwner
	| o |
	o := self owner.
	o isNil ifFalse: [ GRPlatform current terminateProcess: o ]