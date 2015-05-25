parsing
parseObject
	| result |
	self expectChar: ${.
	result := self createObject.
	(self matchChar: $})
		ifTrue: [ ^ result ].
	[ stream atEnd ] whileFalse: [
		result := self
			addProperty: self parseProperty
			to: result.
		(self matchChar: $})
			ifTrue: [ ^ result ].
		self expectChar: $, ].
	self error: 'end of object expected'