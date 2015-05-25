testing
isActive
	^ (requestor isSelected: target) and: [ target isHandler and: [ target canHaveChildren ] ]