accessing
argumentsDo: aBlock
	options isNil ifFalse: [ 
		aBlock value: options ]