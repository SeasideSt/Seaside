testing
isSsl
	^ self scheme isEmptyOrNil not
		and: [ self scheme last = $s ]