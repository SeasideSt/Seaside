accessing
browserClass
	^ Smalltalk at: ((Smalltalk hasClassNamed: #Nautilus)
		ifTrue: [ #WANautilusBrowser ]
		ifFalse: [ #Browser ])