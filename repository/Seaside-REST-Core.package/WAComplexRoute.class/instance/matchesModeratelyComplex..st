private
matchesModeratelyComplex: aCollectionOfStrings
	
	pathMatches size = aCollectionOfStrings size
		ifFalse: [ ^ false ].
	pathMatches with: aCollectionOfStrings do: [ :match :each |
		(match matches: each)
			ifFalse: [ ^ false ] ].
	^ true