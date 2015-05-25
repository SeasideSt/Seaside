private
before
	self isOptional ifTrue: [ self renderOptional ].
	super before