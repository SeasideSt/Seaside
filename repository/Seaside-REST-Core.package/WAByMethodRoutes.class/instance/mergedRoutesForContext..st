private
mergedRoutesForContext: aRequestContext
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