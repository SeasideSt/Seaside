parsing-internal
parseProperty
	| name value |
	name := self parseString.
	self expectChar: $:.
	value := self parseValue.
	^ self createProperty: name with: value