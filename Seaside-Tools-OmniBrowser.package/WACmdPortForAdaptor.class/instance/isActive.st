testing
isActive
	^ (requestor isSelected: target)
		and: [ target isStopped ]