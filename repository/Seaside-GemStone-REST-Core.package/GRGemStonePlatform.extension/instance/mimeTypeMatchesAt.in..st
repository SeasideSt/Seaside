*seaside-gemstone-REST-core
mimeTypeMatchesAt: aSymbol in: aMethod
	| matches |
	matches := aMethod pragmas
		select: [ :each | each keyword = aSymbol ]
		thenCollect: [ :each | WAMimeTypeMatch fromString: each arguments first ].
	^ matches isEmpty
		ifTrue: [ WAWildcardMimeTypeMatch new ]
		ifFalse: [ WACompositeMimeTypeMatch matches: matches  ]