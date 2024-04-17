Class {
	#name : #WAByMethodCleanRoutes,
	#superclass : #WAByMethodRoutes,
	#category : #'Seaside-Stateless-Core'
}

{ #category : #private }
WAByMethodCleanRoutes >> buildContainers: aDictionary [
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
			methodRoutes add: (WACleanRouteContainer routes: each) ] ].
	^ result
]

{ #category : #private }
WAByMethodCleanRoutes >> mergedRoutesForContext: aRequestContext [
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
	^ WACleanRouteContainer routes: (routes gather: [ :each | each routes ])
]

{ #category : #private }
WAByMethodCleanRoutes >> privateRouteForContext: aRequestContext ifAbsent: aNiladicBlock [
	| routeContainer parameters elements |
	routeContainer := self mergedRoutesForContext: aRequestContext.
	routeContainer isNil
		ifTrue: [ ^ aNiladicBlock value ].
	parameters := Dictionary new.
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
