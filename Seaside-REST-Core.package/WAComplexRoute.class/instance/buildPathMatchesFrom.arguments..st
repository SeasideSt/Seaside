private
buildPathMatchesFrom: aUrl arguments: aCollectionOfStrings
	| index |
	index := 0.
	^ aUrl path collect: [ :each |
		index := index + 1.
		WAPPathMatch fromString: each index: index arguments: aCollectionOfStrings ]