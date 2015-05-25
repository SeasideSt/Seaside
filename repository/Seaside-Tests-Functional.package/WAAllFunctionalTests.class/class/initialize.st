initialization
initialize
	(WAAdmin register: self asApplicationAt: 'tests/functional')
		preferenceAt: #sessionClass put: WAExpirySession