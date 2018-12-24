accessing
browserClass
	^ Smalltalk at: ((Smalltalk hasClassNamed: #Browser)
		ifTrue: [ #Browser ]
		ifFalse: [ #WARPackageBasedBrowser ])