accessing
at: aKey ifAbsent: aBlock
	delegates do: [ :each |
		each
			at: aKey
			ifPresent: [ :value | ^ value ] ].
	^ aBlock value