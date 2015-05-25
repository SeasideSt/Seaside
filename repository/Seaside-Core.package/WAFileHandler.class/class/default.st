accessing
default

	default isNil ifTrue: [ default := self new ].
	^ default