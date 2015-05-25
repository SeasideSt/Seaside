accessing
isWriteable
	^ self isOverride or: [ self isModify ]