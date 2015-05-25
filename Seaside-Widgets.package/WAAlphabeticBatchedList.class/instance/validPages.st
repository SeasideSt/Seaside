accessing-calculated
validPages
	^ (items collect: [ :each |
		each greaseString asUppercase first ]) asSet sorted