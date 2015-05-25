private
buildContainers: aDictionary
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