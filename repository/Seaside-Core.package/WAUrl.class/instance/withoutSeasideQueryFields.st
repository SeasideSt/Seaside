copying
withoutSeasideQueryFields

	"Returns a copy of receiver without Seaside query fields (which are prefixed with `_`)"

	| newUrl |
	newUrl := self copy.
	(self queryFields keys select: [ :f | self isSeasideField: f ]) 
		do: [ :f | newUrl queryFields removeKey: f ifAbsent: [  ] ].
	^ newUrl