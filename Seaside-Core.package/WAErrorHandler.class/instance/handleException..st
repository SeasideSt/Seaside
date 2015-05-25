actions
handleException: anException
	(Error handles: anException)
		ifTrue: [ ^ self handleError: anException ].
	(Warning handles: anException)
		ifTrue: [ ^ self handleWarning: anException ].

	^ super handleException: anException