private
zincServer

	^ (Smalltalk at: #GemServer ifAbsent: [ nil ])
		  ifNil: [ WAAdmin serverAdaptors first server ]
		  ifNotNil: [ ((Smalltalk at: #GemServer) gemServerNamed: 'Seaside') serverInstance ]