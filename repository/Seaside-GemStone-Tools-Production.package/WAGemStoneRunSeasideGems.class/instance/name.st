accessing
name

	name == nil ifTrue: [ ^self adaptorClass name ].
	^name