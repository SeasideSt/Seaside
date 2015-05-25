compatibility
default
	^ (default notNil and: [ default manager notNil ])
		ifTrue: [ default ]
		ifFalse: [ nil ]