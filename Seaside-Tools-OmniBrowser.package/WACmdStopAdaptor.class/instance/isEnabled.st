testing
isEnabled
	^ (requestor isSelected: target) and: [ target isServerAdaptor and: [ target canStop ] ]