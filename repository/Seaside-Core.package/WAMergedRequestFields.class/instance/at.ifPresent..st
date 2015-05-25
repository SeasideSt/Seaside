accessing
at: aKey ifPresent: aBlock
	delegates do: [ :each |
		each
			at: aKey
			ifPresent: [ :value | ^ aBlock value: value ] ].
	^ nil