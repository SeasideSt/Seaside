initialization
initializeWithRoutes: aCollectionOfRoutes
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