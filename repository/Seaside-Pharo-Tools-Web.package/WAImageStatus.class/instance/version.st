accessing
version
	^ (Smalltalk hasClassNamed: #SystemVersion)
		ifTrue: [ ((Smalltalk classNamed: #SystemVersion) perform: #current) shortVersionString ]
		ifFalse: [ Smalltalk perform: #version ]