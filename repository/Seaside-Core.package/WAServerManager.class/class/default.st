accessing
default

	self initializeDefaultValueHolder.
	Default contents ifNil: [ Default contents: self new ].
	^ Default contents