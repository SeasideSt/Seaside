accessing
default

	Default == nil ifTrue: [ Default := self new ].
	^Default