tests
testSmallDictionaryConversion
	| dict |
	dict := GRSmallDictionary2 new at: 1 put: 2; yourself.
	collection := dict seasideRequestFields.
	self assert: (collection isKindOf: WARequestFields).
	self assertAssociations: (Array with: 1 -> 2)