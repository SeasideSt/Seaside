testing
isLocal
	^ (self isGlobal or: [ self isDelegation ]) not