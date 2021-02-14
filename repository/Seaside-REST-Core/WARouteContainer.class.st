"
A WARouteContainer is a collection of routes that all accept the same number of path elements ordered by priority.

Instance Variables
	pathElementCount:		<Integer>
	routes:		<SortedCollection<WARoute>>

pathElementCount
	- the number of path elements that any of the routes in this container accepts

routes
	- the routes ordered by priority

"
Class {
	#name : #WARouteContainer,
	#superclass : #WAObject,
	#instVars : [
		'pathElementCount',
		'routes'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WARouteContainer class >> pathElementCount: anInteger [
	^ self basicNew initializeWith: anInteger
]

{ #category : #'instance creation' }
WARouteContainer class >> routes: aCollectionOfRoutes [
	^ (self pathElementCount: aCollectionOfRoutes first pathElementCount)
		addRoutes: aCollectionOfRoutes;
		yourself
]

{ #category : #public }
WARouteContainer >> addRoute: aRoute [
	^ routes add: aRoute
]

{ #category : #public }
WARouteContainer >> addRoutes: aCollectionOfRoutes [
	aCollectionOfRoutes do: [ :each |
		self addRoute: each ]
]

{ #category : #private }
WARouteContainer >> compare: a and: b byAccept: aSortedCollectionOfAccept [
	^ self compare: a and: b using: aSortedCollectionOfAccept
]

{ #category : #private }
WARouteContainer >> compare: a and: b byContentType: aMimeType thenByAccept: aSortedCollectionOfAccept [
	| aPriority bPriority |
	aPriority := a consumesPriorityFor: aMimeType.
	bPriority := b consumesPriorityFor: aMimeType.
	^ aPriority ~= bPriority
		ifTrue: [ aPriority < bPriority ifTrue: [ -1 ] ifFalse: [ 1 ] ]
		ifFalse: [
			aSortedCollectionOfAccept isEmpty
				ifTrue: [ 0 "both are equal" ]
				ifFalse: [ self compare: a and: b byAccept: aSortedCollectionOfAccept ] ]
]

{ #category : #private }
WARouteContainer >> compare: a and: b using: aSortedCollectionOfAccept [
	aSortedCollectionOfAccept acceptsDo: [ :accepts |
		| aPriority bPriority |
		aPriority := -1.
		bPriority := -1.
		accepts do: [ :each |
			aPriority := aPriority max: (a producesPriorityFor: each).
			bPriority := bPriority max: (b producesPriorityFor: each) ].
		aPriority ~= bPriority
			ifTrue: [
				^ aPriority < bPriority ifTrue: [ -1 ] ifFalse: [ 1 ] ] ].
	^ 0 "both are equal"
]

{ #category : #private }
WARouteContainer >> compareByPathThenContentType: aMimeType thenByAccept: aSortedCollectionOfAccept [
	^ [ :a :b |
		| aPathPriority bPathPriority |
		aPathPriority := a priority.
		bPathPriority := b priority.
		(aPathPriority ~= bPathPriority or: [ aMimeType isNil and: [ aSortedCollectionOfAccept isNil ] ])
			ifTrue: [ aPathPriority < bPathPriority ifTrue: [ -1 ] ifFalse: [ 1 ] ]
			ifFalse: [
				aMimeType isNil
					ifTrue: [ self compare: a and: b byAccept: aSortedCollectionOfAccept ]
					ifFalse: [ self compare: a and: b byContentType: aMimeType thenByAccept: aSortedCollectionOfAccept ] ] ]
	
]

{ #category : #initialization }
WARouteContainer >> initializeWith: anInteger [
	self initialize.
	pathElementCount := anInteger.
	routes := SortedCollection sortBlock: [ :a :b |
		a priority > b priority ]
]

{ #category : #public }
WARouteContainer >> pathElementCount [
	^ pathElementCount
]

{ #category : #public }
WARouteContainer >> routeForElements: aCollection parameters: aDictionary contentType: aMimeType accept: aCollectionOfAccept ifAbsent: anAbsentBlock [
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
]

{ #category : #public }
WARouteContainer >> routes [
	^ routes
]

{ #category : #private }
WARouteContainer >> sortByPathThenContentType: aMimeType thenByAccept: aSortedCollectionOfAccept [
	| block |
	block := self compareByPathThenContentType: aMimeType thenByAccept: aSortedCollectionOfAccept.
	^ [ :a :b |
		(block value: a value: b) = 1 ]
	
]
