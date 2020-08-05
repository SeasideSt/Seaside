copying
withoutSeasideQueryFields
	"Returns a copy of receiver without the DEFAULT query fields
	used for tracking session (_s), continuation (_k) or document (_d)."

	| newUrl |
	newUrl := self copy.
	newUrl queryFields
		removeKey: '_s' ifAbsent: [  ];
		removeKey: '_k' ifAbsent: [  ];
		removeKey: '_d' ifAbsent: [  ].
	^ newUrl