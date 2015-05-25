accessing-calculated
batch
	^ items select: [ :each |
		each greaseString asUppercase first = self currentPage ]