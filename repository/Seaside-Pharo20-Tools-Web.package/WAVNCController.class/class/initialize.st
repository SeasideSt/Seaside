initialization
initialize
	(Smalltalk hasClassNamed: #RFBServer)
		ifTrue: [ WAAdmin register: self asApplicationAt: 'tools/vnc' ]