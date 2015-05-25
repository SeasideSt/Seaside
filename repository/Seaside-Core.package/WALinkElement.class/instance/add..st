accessing-children
add: anElement
	super add: anElement.
	attributes isNil ifFalse: [
		attributes removeKey: 'rel' ifAbsent: [ "ignore" ] ]