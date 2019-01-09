accessing
name

	name == nil ifTrue: [ ^self serverClass name ].
	^name