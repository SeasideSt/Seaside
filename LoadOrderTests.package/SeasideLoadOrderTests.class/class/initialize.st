initialization
initialize

	(UIManager default confirm: 'Load Seaside 3.0?') ifTrue: [
		self new doLoad.
	].
