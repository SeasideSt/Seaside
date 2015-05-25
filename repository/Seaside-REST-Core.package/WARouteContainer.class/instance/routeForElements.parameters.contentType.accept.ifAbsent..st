public
routeForElements: aCollection parameters: aDictionary contentType: aMimeType accept: aCollectionOfAccept ifAbsent: anAbsentBlock
	| result sortedAccept |
	result := (routes select: [ :each |
			(each matchesPath: aCollection)
				and: [ (each matchesParameters: aDictionary)
				and: [ (aMimeType isNil or: [ each consumes: aMimeType ])
				and: [ aCollectionOfAccept isNil or: [ each produces: aCollectionOfAccept ] ] ] ] ]) asArray.
	result isEmpty
		ifTrue: [ ^ anAbsentBlock value ].
	result size = 1
		ifTrue: [ ^ result first ].
	sortedAccept := WASortedAccepts accepts: aCollectionOfAccept.
	result sort: (self sortByPathThenContentType: aMimeType thenByAccept: sortedAccept).
	
	"when the first and second highest priority match have the same priority we have an conflict"
	^ ((self compareByPathThenContentType: aMimeType thenByAccept: sortedAccept) value: result first value: result second) = 0
		ifTrue: [ anAbsentBlock value ]
		ifFalse: [ result first ]