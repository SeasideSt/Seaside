private
matchesOverlyComplex: aCollectionOfStrings
	| collectionIndex |

	pathMatches size > (aCollectionOfStrings size + 1)
		ifTrue: [ ^ false ].
	
	collectionIndex := 1.
	pathMatches keysAndValuesDo: [ :index :each |
		each matchesJustOneElement
			ifTrue: [
				(each matches: (aCollectionOfStrings at: collectionIndex))
					ifFalse: [ ^ false ].
				collectionIndex := collectionIndex + 1 ]
			ifFalse: [
				| matchEnd |
				matchEnd := aCollectionOfStrings size - (pathMatches size - index).
				collectionIndex to: matchEnd do: [ :submatchIndex |
					(each matches: (aCollectionOfStrings at: submatchIndex))
						ifFalse: [ ^ false ] ].
				collectionIndex := matchEnd + 1 ] ].

	^ true