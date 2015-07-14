instance creation
value: aBlock
	^ self new
		value: aBlock;
		id: self newId;
		yourself