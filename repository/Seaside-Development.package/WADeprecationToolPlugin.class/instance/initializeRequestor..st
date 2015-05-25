initialization
initializeRequestor: aRequestorObject
	super initializeRequestor: aRequestorObject.
	filter := self session filters
		detect: [ :each | each isKindOf: WADeprecatedToolFilter ]
		ifNone: [ self session addFilter: WADeprecatedToolFilter new ]