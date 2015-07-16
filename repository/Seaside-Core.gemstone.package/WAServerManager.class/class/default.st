accessing
default
	default contents ifNil: [ default contents: self new ].
	^ default contents