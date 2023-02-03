*Zinc-Seaside
hasQueryField: aString

	self queryAt: aString ifAbsent: [ ^ false ].
	^ true