testing
isComponent
	"Answer true if the body of the receiver is a component, and therefor needs to be registered as a child."

	^ self body isKindOf: WAComponent