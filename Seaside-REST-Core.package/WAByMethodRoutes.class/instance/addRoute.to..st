private
addRoute: aRoute to: aDictionary
	| methodRoutes subRoutes |
	methodRoutes := aDictionary
		at: aRoute method
		ifAbsentPut: [ Dictionary new ].
	subRoutes := methodRoutes at: aRoute pathElementCount ifAbsentPut: [ OrderedCollection new ].
	subRoutes add: aRoute