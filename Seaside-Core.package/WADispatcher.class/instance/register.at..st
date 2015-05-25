parent/child
register: aRequestHandler at: aString 
	aString ifNil: [ WAError signal: 'Registration key cannot be nil.' ].
	handlers 
		at: aString
		put: (aRequestHandler setParent: self; yourself).
	^ aRequestHandler