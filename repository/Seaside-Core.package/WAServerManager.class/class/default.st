accessing
default

	self ensureDefaultValueHolder.
	Default contents ifNil: [ Default contents: self new ].
	^ Default contents