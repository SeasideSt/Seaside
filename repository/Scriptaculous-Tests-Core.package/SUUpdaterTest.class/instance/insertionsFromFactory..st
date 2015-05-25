accessing
insertionsFromFactory: aFactory
	^ Array
		with: aFactory insertion before
		with: aFactory insertion top
		with: aFactory insertion bottom
		with: aFactory insertion after