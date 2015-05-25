testing
isActive
	^ self requestor dispatcher notNil and: [ self requestor dispatcher defaultName notNil ]