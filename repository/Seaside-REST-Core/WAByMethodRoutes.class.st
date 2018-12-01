"
A WAByMethodRoutes is a collection of routes first organized by HTTP method and then by number of URL path elements. It allows users to look up possible routes for a given HTTP request.

See also WARouteResult and WARouteContainer.

Instance Variables
	routes:		<Dictionary<String, SortedCollection<WARouteContainer>>

routes
	- the routes keyed by HTTP method, sorted by number of path elements

"
Class {
	#name : #WAByMethodRoutes,
	#superclass : #WAObject,
	#instVars : [
		'fixedContainers',
		'flexibleContainers'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WAByMethodRoutes class >> routes: aCollectionOfRoutes [
	^ self basicNew initializeWithRoutes: aCollectionOfRoutes
]

{ #category : #private }
WAByMethodRoutes >> addRoute: aRoute to: aDictionary [
	| methodRoutes subRoutes |
	methodRoutes := aDictionary
		at: aRoute method
		ifAbsentPut: [ Dictionary new ].
	subRoutes := methodRoutes at: aRoute pathElementCount ifAbsentPut: [ OrderedCollection new ].
	subRoutes add: aRoute
]

{ #category : #private }
WAByMethodRoutes >> buildContainers: aDictionary [
	| result |
	result := Dictionary new.
	aDictionary keysAndValuesDo: [ :method :subroutes |
		| methodRoutes |
		methodRoutes := result
			at: method
			ifAbsentPut: [
				SortedCollection sortBlock: [ :a :b |
					a pathElementCount <= b pathElementCount ] ].
		subroutes do: [ :each |
			methodRoutes add: (WARouteContainer routes: each) ] ].
	^ result
]

{ #category : #private }
WAByMethodRoutes >> fixedRoutesForContext: aRequestContext [
	| elementCount routesForMethod |
	elementCount := aRequestContext consumer peekToEnd size.
	routesForMethod := fixedContainers at: aRequestContext request method ifAbsent: [ ^ nil ].
	^ routesForMethod
		detect: [ :each |
			each pathElementCount = elementCount ]
		ifNone: [ nil ]
]

{ #category : #private }
WAByMethodRoutes >> flexibleRoutesForContext: aRequestContext [
	| elementCount routesForMethod startIndex endIndex |
	elementCount := aRequestContext consumer peekToEnd size.
	startIndex := nil.
	routesForMethod := flexibleContainers at: aRequestContext request method ifAbsent: [ ^ nil ].
	routesForMethod keysAndValuesDo: [ :index :each |
		(each pathElementCount >= (elementCount - 1) and: [ startIndex isNil ])
			ifTrue: [ startIndex := index ].
		(each pathElementCount > elementCount and: [ endIndex notNil ])
			ifTrue: [ endIndex := index ] ].
	startIndex isNil
		ifTrue: [ ^ nil ].
	endIndex isNil
		ifTrue: [ endIndex := routesForMethod size ].
	^ routesForMethod copyFrom: startIndex to: endIndex
	
]

{ #category : #initialization }
WAByMethodRoutes >> initializeWithRoutes: aCollectionOfRoutes [
	| standardRouteBuilder flexibleRouteBuilder |
	self initialize.
	standardRouteBuilder := Dictionary new.
	flexibleRouteBuilder := Dictionary new.
	aCollectionOfRoutes do: [ :each |
		each matchesFlexibleNumberOfPathElements
			ifTrue: [ self addRoute: each to: flexibleRouteBuilder ]
			ifFalse: [ self addRoute: each to: standardRouteBuilder ] ].
	fixedContainers := self buildContainers: standardRouteBuilder.
	flexibleContainers := self buildContainers: flexibleRouteBuilder
]

{ #category : #private }
WAByMethodRoutes >> mergedRoutesForContext: aRequestContext [
	| routes fixed flexibles |
	routes := OrderedCollection new.
	fixed := self fixedRoutesForContext: aRequestContext.
	fixed isNil ifFalse: [
		routes add: fixed ].
	flexibles := self flexibleRoutesForContext: aRequestContext.
	flexibles isNil ifFalse: [
		routes addAll: flexibles ].
	routes isEmpty
		ifTrue: [ ^ nil ].
	routes size = 1
		ifTrue: [ ^ routes first ].
	^ WARouteContainer routes: (routes gather: [ :each | each routes ])
]

{ #category : #private }
WAByMethodRoutes >> privateRouteForContext: aRequestContext ifAbsent: aNiladicBlock [
	| routeContainer parameters elements |
	routeContainer := self mergedRoutesForContext: aRequestContext.
	routeContainer isNil
		ifTrue: [ ^ aNiladicBlock value ].
	parameters := aRequestContext request url queryFields.
	elements := aRequestContext consumer peekToEnd.
	^ WARouteResult
		route: (routeContainer
			routeForElements: elements
			parameters: parameters
			contentType: aRequestContext request contentType 
			accept: aRequestContext request accept
			ifAbsent: [ ^ aNiladicBlock value ])
		elements: elements
		parameters: parameters
]

{ #category : #public }
WAByMethodRoutes >> routeForContext: aRequestContext consume: aBoolean ifAbsent: aNiladicBlock [
	| found result |
	found := true.
	result := self
		privateRouteForContext: aRequestContext
		ifAbsent: [
			found := false.
			aNiladicBlock value ].
	(found and: [ aBoolean ]) ifTrue: [
		"we found something this means we consume the entire path"
		aRequestContext consumer upToEnd ].
	^ result
]
