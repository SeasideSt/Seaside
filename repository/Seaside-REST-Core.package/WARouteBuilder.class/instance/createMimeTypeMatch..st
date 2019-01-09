private
createMimeTypeMatch: aCollection
	^ aCollection isEmpty
		ifTrue: [ WAWildcardMimeTypeMatch new ]
		ifFalse: [
			aCollection size = 1
				ifTrue: [ aCollection first ]
				ifFalse: [ WACompositeMimeTypeMatch matches: aCollection ] ]