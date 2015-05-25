private
createMimeTypeMatch: aCollection
	^ aCollection isEmpty
		ifTrue: [ WAWildcardMimeTypeMatch new ]
		ifFalse: [ WACompositeMimeTypeMatch matches: aCollection ]