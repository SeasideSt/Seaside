actions
addFilterForClass: aFilterClass
	aFilterClass isNil
		ifFalse: [ self handler addFilter: aFilterClass new ]