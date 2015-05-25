testing
isActive
	^ self handler notNil and: [ self handler parent notNil ]
