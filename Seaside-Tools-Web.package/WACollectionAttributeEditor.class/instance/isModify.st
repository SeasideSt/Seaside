accessing
isModify
	^ self expression notNil and: [ self isOverride not ]