testing
isEnabled
	^ (requestor isSelected: target) and: [ target canRemove ]