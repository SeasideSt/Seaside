parsing
parseArray
	| result |
	self expectChar: $[.
	result := self createArray.
	(self matchChar: $])
		ifTrue: [ ^ result ].
	[ stream atEnd ] whileFalse: [
		result := self
			addValue: self parseValue
			to: result.
		(self matchChar: $]) 
			ifTrue: [ ^ result ].
		self expectChar: $, ].
	self error: 'end of array expected'